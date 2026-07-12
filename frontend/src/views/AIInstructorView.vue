<template>
  <div class="flex flex-col h-full">
    <!-- Header / mode selector -->
    <div class="border-b border-slate-700/50 bg-navy-800 px-6 py-4">
      <h1 class="font-semibold text-white mb-3">AI Instructor</h1>
      <div class="flex gap-2 flex-wrap">
        <button v-for="m in modes" :key="m.value"
          @click="mode = m.value"
          class="text-xs font-medium px-3 py-1.5 rounded-lg border transition-colors"
          :class="mode === m.value
            ? 'bg-aviation-600/20 border-aviation-500/50 text-aviation-300'
            : 'border-slate-600 text-slate-400 hover:border-slate-500 hover:text-slate-300'">
          {{ m.label }}
        </button>
      </div>
      <div class="mt-3">
        <input v-model="subject" placeholder="Subject / topic (optional)"
          class="w-full sm:w-72 bg-navy-900 border border-slate-600 rounded-xl px-3 py-1.5 text-sm text-white
                 placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-aviation-500" />
      </div>
    </div>

    <!-- Messages -->
    <div ref="messagesEl" class="flex-1 overflow-y-auto px-6 py-4 space-y-4">
      <div v-if="!messages.length" class="flex flex-col items-center justify-center h-full text-center">
        <div class="w-16 h-16 rounded-full bg-aviation-900/30 border border-aviation-500/30 flex items-center justify-center mb-4">
          <svg class="w-8 h-8 text-aviation-400" fill="currentColor" viewBox="0 0 24 24">
            <path d="M12 2a10 10 0 1 0 10 10A10 10 0 0 0 12 2zm1 14H11v-2h2zm0-4H11V7h2z"/>
          </svg>
        </div>
        <p class="text-slate-300 font-medium">Your AI EASA Instructor</p>
        <p class="text-slate-500 text-sm mt-1 max-w-xs">Select a mode, optionally specify a topic, then ask your question.</p>
      </div>

      <template v-for="(msg, i) in messages" :key="i">
        <!-- User -->
        <div v-if="msg.role === 'user'" class="flex justify-end">
          <div class="max-w-[80%] bg-aviation-600/20 border border-aviation-500/30 rounded-2xl rounded-tr-sm px-4 py-3">
            <p class="text-sm text-slate-200 whitespace-pre-wrap">{{ msg.content }}</p>
          </div>
        </div>
        <!-- Assistant -->
        <div v-else class="flex gap-3">
          <div class="w-8 h-8 rounded-full bg-aviation-900/40 border border-aviation-500/30 flex items-center justify-center flex-shrink-0 mt-1">
            <svg class="w-4 h-4 text-aviation-400" fill="currentColor" viewBox="0 0 24 24">
              <path d="M21 16v-2l-8-5V3.5a1.5 1.5 0 0 0-3 0V9l-8 5v2l8-2.5V19l-2 1.5V22l3.5-1 3.5 1v-1.5L13 19v-5.5z"/>
            </svg>
          </div>
          <div class="max-w-[80%] bg-navy-800 border border-slate-700/50 rounded-2xl rounded-tl-sm px-4 py-3">
            <p class="text-sm text-slate-200 whitespace-pre-wrap">{{ msg.content }}<span v-if="streaming && i === messages.length - 1" class="inline-block w-1.5 h-4 bg-aviation-400 ml-0.5 animate-pulse" /></p>
          </div>
        </div>
      </template>
    </div>

    <!-- Input -->
    <div class="border-t border-slate-700/50 bg-navy-800 px-6 py-4">
      <form @submit.prevent="send" class="flex gap-3">
        <input v-model="input" :disabled="streaming"
          placeholder="Ask a question…"
          class="flex-1 bg-navy-900 border border-slate-600 rounded-xl px-4 py-2.5 text-sm text-white
                 placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-aviation-500
                 disabled:opacity-50" />
        <button type="submit" :disabled="!input.trim() || streaming"
          class="bg-aviation-600 hover:bg-aviation-500 disabled:opacity-40 disabled:cursor-not-allowed
                 text-white px-5 py-2.5 rounded-xl text-sm font-medium transition-colors flex-shrink-0">
          {{ streaming ? '…' : 'Send' }}
        </button>
      </form>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, nextTick, onMounted } from 'vue'
import { useRoute } from 'vue-router'

const route = useRoute()

interface Message {
  role: 'user' | 'assistant'
  content: string
}

const modes = [
  { value: 'beginner_explain', label: 'Beginner' },
  { value: 'technical',        label: 'Technical' },
  { value: 'practical',        label: 'Practical Example' },
  { value: 'compare',          label: 'Compare Systems' },
  { value: 'oral_exam',        label: 'Oral Exam' },
  { value: 'explain_mistake',  label: 'Explain My Mistake' },
  { value: 'weak_points',      label: 'Review Weak Points' },
]

const mode = ref('beginner_explain')
const subject = ref('')
const input = ref('')
const messages = ref<Message[]>([])
const streaming = ref(false)
const messagesEl = ref<HTMLDivElement | null>(null)

onMounted(() => {
  if (route.query.subject) {
    subject.value = String(route.query.subject)
  }
})

async function send() {
  const text = input.value.trim()
  if (!text || streaming.value) return

  messages.value.push({ role: 'user', content: text })
  input.value = ''
  streaming.value = true

  const assistantMsg: Message = { role: 'assistant', content: '' }
  messages.value.push(assistantMsg)
  scrollBottom()

  const token = localStorage.getItem('token') ?? ''
  const history = messages.value
    .slice(0, -2) // exclude the two we just pushed
    .map(m => ({ role: m.role, content: m.content }))

  const res = await fetch('/api/v1/ai/chat', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      Authorization: `Bearer ${token}`,
    },
    body: JSON.stringify({
      mode: mode.value,
      subject: subject.value,
      message: text,
      history,
    }),
  })

  if (!res.ok || !res.body) {
    assistantMsg.content = 'Error: could not reach AI service.'
    streaming.value = false
    return
  }

  const reader = res.body.getReader()
  const decoder = new TextDecoder()
  let buffer = ''

  while (true) {
    const { done, value } = await reader.read()
    if (done) break
    buffer += decoder.decode(value, { stream: true })
    const lines = buffer.split('\n')
    buffer = lines.pop() ?? ''

    for (const line of lines) {
      if (line.startsWith('data: ')) {
        try {
          const data = JSON.parse(line.slice(6))
          if (data.token) {
            assistantMsg.content += data.token
            await nextTick()
            scrollBottom()
          }
        } catch { /* skip malformed */ }
      }
    }
  }

  streaming.value = false
}

function scrollBottom() {
  nextTick(() => {
    if (messagesEl.value) {
      messagesEl.value.scrollTop = messagesEl.value.scrollHeight
    }
  })
}
</script>
