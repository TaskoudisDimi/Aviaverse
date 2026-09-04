<template>
  <div class="flex flex-col h-full">
    <!-- Header / mode selector -->
    <div class="border-b border-slate-700/50 bg-navy-800 px-6 py-4 shrink-0">
      <div class="flex items-center justify-between mb-3">
        <h1 class="font-semibold text-white">AI Instructor</h1>
        <button v-if="messages.length" @click="clearChat"
          class="text-xs text-slate-500 hover:text-red-400 transition-colors flex items-center gap-1">
          <svg class="w-3.5 h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
              d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"/>
          </svg>
          Clear chat
        </button>
      </div>
      <div class="flex gap-2 flex-wrap">
        <button v-for="m in modes" :key="m.value"
          @click="mode = m.value; savePrefs()"
          class="text-xs font-medium px-3 py-1.5 rounded-lg border transition-colors"
          :class="mode === m.value
            ? 'bg-aviation-600/20 border-aviation-500/50 text-aviation-300'
            : 'border-slate-600 text-slate-400 hover:border-slate-500 hover:text-slate-300'">
          {{ m.label }}
        </button>
      </div>
      <div class="mt-3">
        <input v-model="subject" @change="savePrefs" placeholder="Subject / topic (optional)"
          class="w-full sm:w-72 bg-navy-900 border border-slate-600 rounded-xl px-3 py-1.5 text-sm text-white
                 placeholder-slate-500 focus:outline-none focus:ring-2 focus:ring-aviation-500" />
      </div>
    </div>

    <!-- Messages -->
    <div ref="messagesEl" class="flex-1 overflow-y-auto px-4 sm:px-6 py-4 space-y-4">
      <div v-if="!messages.length" class="flex flex-col items-center justify-center h-full text-center px-4">
        <div class="w-16 h-16 rounded-full bg-aviation-900/30 border border-aviation-500/30 flex items-center justify-center mb-4">
          <svg class="w-8 h-8 text-aviation-400" fill="currentColor" viewBox="0 0 24 24">
            <path d="M21 16v-2l-8-5V3.5a1.5 1.5 0 0 0-3 0V9l-8 5v2l8-2.5V19l-2 1.5V22l3.5-1 3.5 1v-1.5L13 19v-5.5z"/>
          </svg>
        </div>
        <p class="text-slate-300 font-medium">Your AI EASA Instructor</p>
        <p class="text-slate-500 text-sm mt-1 max-w-xs">
          Select a mode, optionally specify a subject, then ask your question.<br/>
          <span class="text-slate-600 text-xs mt-1 block">Your conversation is saved automatically.</span>
        </p>
      </div>

      <template v-for="(msg, i) in messages" :key="i">
        <!-- User -->
        <div v-if="msg.role === 'user'" class="flex justify-end">
          <div class="max-w-[85%] bg-aviation-600/20 border border-aviation-500/30 rounded-2xl rounded-tr-sm px-4 py-3">
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
          <div class="max-w-[85%] bg-navy-800 border border-slate-700/50 rounded-2xl rounded-tl-sm px-4 py-3 min-w-0">
            <!-- Streaming: show plain text while streaming for performance -->
            <p v-if="streaming && i === messages.length - 1"
              class="text-sm text-slate-200 whitespace-pre-wrap">{{ msg.content }}<span
              class="inline-block w-1.5 h-4 bg-aviation-400 ml-0.5 animate-pulse align-middle" /></p>
            <!-- Rendered markdown for completed messages -->
            <div v-else
              class="prose prose-invert prose-sm max-w-none
                prose-p:text-slate-200 prose-p:leading-relaxed prose-p:my-1
                prose-headings:text-aviation-300 prose-headings:font-semibold prose-headings:mt-3 prose-headings:mb-1
                prose-strong:text-white
                prose-code:text-aviation-300 prose-code:bg-navy-900/70 prose-code:px-1 prose-code:rounded prose-code:text-xs prose-code:before:content-none prose-code:after:content-none
                prose-pre:bg-navy-900/80 prose-pre:border prose-pre:border-slate-700/50 prose-pre:rounded-xl
                prose-li:text-slate-200 prose-li:my-0.5
                prose-table:text-sm prose-th:text-aviation-300 prose-th:bg-navy-900/50 prose-td:border-slate-700/40 prose-th:border-slate-700/40
                prose-blockquote:border-aviation-500 prose-blockquote:text-slate-400"
              v-html="renderMd(msg.content)" />
          </div>
        </div>
      </template>
    </div>

    <!-- Input -->
    <div class="border-t border-slate-700/50 bg-navy-800 px-4 sm:px-6 py-4 shrink-0">
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
import { marked } from 'marked'

const route = useRoute()

interface Message {
  role: 'user' | 'assistant'
  content: string
}

const STORAGE_KEY = 'aviaverse-chat'

const modes = [
  { value: 'beginner',        label: 'Beginner' },
  { value: 'technical',       label: 'Technical' },
  { value: 'practical',       label: 'Practical Example' },
  { value: 'compare',         label: 'Compare Systems' },
  { value: 'oral',            label: 'Oral Exam' },
  { value: 'explain_mistake', label: 'Explain My Mistake' },
  { value: 'weak_points',     label: 'Review Weak Points' },
]

const mode = ref('beginner')
const subject = ref('')
const input = ref('')
const messages = ref<Message[]>([])
const streaming = ref(false)
const messagesEl = ref<HTMLDivElement | null>(null)

function renderMd(text: string): string {
  try { return marked.parse(text) as string } catch { return text }
}

function saveHistory() {
  try {
    localStorage.setItem(STORAGE_KEY, JSON.stringify({
      messages: messages.value,
      mode: mode.value,
      subject: subject.value,
    }))
  } catch {}
}

function savePrefs() {
  try {
    const stored = JSON.parse(localStorage.getItem(STORAGE_KEY) ?? '{}')
    localStorage.setItem(STORAGE_KEY, JSON.stringify({
      ...stored,
      mode: mode.value,
      subject: subject.value,
    }))
  } catch {}
}

function clearChat() {
  messages.value = []
  try { localStorage.removeItem(STORAGE_KEY) } catch {}
}

onMounted(() => {
  // Restore from localStorage
  try {
    const stored = JSON.parse(localStorage.getItem(STORAGE_KEY) ?? '{}')
    if (stored.messages?.length) messages.value = stored.messages
    if (stored.mode) mode.value = stored.mode
    if (stored.subject) subject.value = stored.subject
  } catch {}

  // Route query overrides subject (when navigating from a subject page)
  if (route.query.subject) {
    subject.value = String(route.query.subject)
  }

  scrollBottom()
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
    .slice(0, -2)
    .map(m => ({ role: m.role, content: m.content }))

  try {
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
      assistantMsg.content = '⚠️ Could not reach AI service. Please try again.'
      streaming.value = false
      saveHistory()
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
            } else if (data.error) {
              assistantMsg.content = `⚠️ AI error: ${data.error}`
            }
          } catch { /* skip malformed */ }
        }
      }
    }
  } catch (e) {
    assistantMsg.content = '⚠️ Network error. Please check your connection.'
  }

  streaming.value = false
  saveHistory()
}

function scrollBottom() {
  nextTick(() => {
    if (messagesEl.value) {
      messagesEl.value.scrollTop = messagesEl.value.scrollHeight
    }
  })
}
</script>
