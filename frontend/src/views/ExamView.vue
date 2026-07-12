<template>
  <div class="flex flex-col h-full">
    <!-- Exam header with countdown -->
    <div class="bg-navy-800 border-b border-slate-700/50 px-6 py-4 flex items-center justify-between">
      <div>
        <p class="text-sm font-medium text-white">Question {{ current + 1 }} / {{ questions.length }}</p>
        <div class="w-48 bg-slate-700 rounded-full h-1.5 mt-2">
          <div class="h-1.5 bg-aviation-500 rounded-full transition-all" :style="{ width: progressPct + '%' }" />
        </div>
      </div>
      <div class="text-right">
        <p class="text-xs text-slate-400">Time remaining</p>
        <p class="text-xl font-bold font-mono" :class="timeColor">{{ timeDisplay }}</p>
      </div>
    </div>

    <!-- Question area -->
    <div class="flex-1 overflow-y-auto px-6 py-8 max-w-3xl mx-auto w-full">
      <div v-if="!session" class="text-center text-slate-400 py-12">
        No active exam session.
        <RouterLink to="/exam" class="text-aviation-400 ml-1">Start one</RouterLink>
      </div>

      <template v-else>
        <div class="bg-navy-800 rounded-2xl p-6 border border-slate-700/50 mb-6">
          <p class="text-base font-medium text-white leading-relaxed">{{ q.text }}</p>
        </div>

        <div class="space-y-3">
          <button v-for="opt in q.options" :key="opt.id"
            @click="answers[q.id] = opt.id"
            class="w-full text-left px-5 py-4 rounded-xl border transition-all"
            :class="answers[q.id] === opt.id
              ? 'bg-aviation-600/20 border-aviation-500 text-white'
              : 'bg-navy-800 border-slate-700/50 text-slate-300 hover:border-slate-500'">
            {{ opt.text }}
          </button>
        </div>

        <!-- Navigation -->
        <div class="flex justify-between mt-8">
          <button @click="current--" :disabled="current === 0"
            class="px-5 py-2.5 rounded-xl border border-slate-600 text-slate-300 hover:bg-slate-700
                   disabled:opacity-30 disabled:cursor-not-allowed text-sm font-medium transition-colors">
            Previous
          </button>

          <button v-if="current < questions.length - 1"
            @click="current++"
            class="px-5 py-2.5 rounded-xl bg-aviation-600 hover:bg-aviation-500 text-white text-sm font-medium transition-colors">
            Next
          </button>

          <button v-else @click="submit" :disabled="submitting"
            class="px-5 py-2.5 rounded-xl bg-green-600 hover:bg-green-500 disabled:opacity-50
                   text-white text-sm font-medium transition-colors">
            {{ submitting ? 'Submitting…' : 'Submit Exam' }}
          </button>
        </div>

        <!-- Answer overview -->
        <div class="mt-8 flex flex-wrap gap-2">
          <button v-for="(_, i) in questions" :key="i"
            @click="current = i"
            class="w-8 h-8 rounded-lg text-xs font-bold transition-colors"
            :class="[
              i === current ? 'ring-2 ring-aviation-400' : '',
              answers[questions[i].id] ? 'bg-aviation-600 text-white' : 'bg-slate-700 text-slate-400'
            ]">
            {{ i + 1 }}
          </button>
        </div>
      </template>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted, onUnmounted } from 'vue'
import { RouterLink, useRouter } from 'vue-router'
import { useExamStore } from '@/stores/exam'
import { api } from '@/lib/api'

const examStore = useExamStore()
const router = useRouter()

const session = computed(() => examStore.session)
const questions = computed(() => session.value?.questions ?? [])
const current = ref(0)
const answers = ref<Record<string, string>>({})
const submitting = ref(false)

const q = computed(() => questions.value[current.value])
const progressPct = computed(() => questions.value.length ? (current.value + 1) / questions.value.length * 100 : 0)

// Countdown timer
const secondsLeft = ref(0)
let timer: ReturnType<typeof setInterval> | null = null

onMounted(() => {
  if (!session.value) {
    router.replace('/exam')
    return
  }
  secondsLeft.value = Math.max(0, Math.floor((new Date(session.value.ends_at).getTime() - Date.now()) / 1000))
  timer = setInterval(() => {
    secondsLeft.value = Math.max(0, secondsLeft.value - 1)
    if (secondsLeft.value === 0) submit()
  }, 1000)
})

onUnmounted(() => { if (timer) clearInterval(timer) })

const timeDisplay = computed(() => {
  const m = Math.floor(secondsLeft.value / 60).toString().padStart(2, '0')
  const s = (secondsLeft.value % 60).toString().padStart(2, '0')
  return `${m}:${s}`
})

const timeColor = computed(() => {
  if (secondsLeft.value > 300) return 'text-white'
  if (secondsLeft.value > 60) return 'text-yellow-400'
  return 'text-red-400 animate-pulse'
})

async function submit() {
  if (submitting.value) return
  submitting.value = true
  if (timer) clearInterval(timer)
  try {
    await api.post('/api/v1/exam/submit', {
      exam_id: session.value!.exam_id,
      answers: answers.value,
    })
    const id = session.value!.exam_id
    examStore.clearSession()
    router.push(`/results/${id}`)
  } catch {
    submitting.value = false
  }
}
</script>
