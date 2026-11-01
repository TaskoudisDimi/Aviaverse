<template>
  <div class="p-4 sm:p-6 max-w-3xl mx-auto space-y-6">
    <RouterLink to="/exam" class="text-sm text-slate-300 hover:text-white flex items-center gap-1">
      ‹ New exam
    </RouterLink>

    <div v-if="loading" class="flex justify-center py-12"><Spinner /></div>

    <template v-else-if="result">
      <!-- Score hero -->
      <div class="bg-white rounded-2xl p-6 sm:p-8 border text-center"
        :class="result.pass_fail === 'PASS' ? 'border-green-200' : 'border-red-200'">
        <div class="text-5xl font-black mb-2"
          :class="result.pass_fail === 'PASS' ? 'text-green-600' : 'text-red-500'">
          {{ result.percentage.toFixed(0) }}%
        </div>
        <div class="text-lg font-bold mb-1"
          :class="result.pass_fail === 'PASS' ? 'text-green-700' : 'text-red-600'">
          {{ result.pass_fail === 'PASS' ? 'Passed' : 'Not Passed' }}
        </div>
        <p class="text-slate-500 text-sm">{{ result.score }} / {{ result.total_questions }} correct · 75% required to pass</p>
      </div>

      <!-- Quick actions -->
      <div class="flex flex-col sm:flex-row gap-3">
        <RouterLink to="/exam"
          class="flex-1 text-center bg-aviation-500 hover:bg-aviation-600 text-white text-sm font-medium py-2.5 rounded-xl transition-colors">
          Retake Exam
        </RouterLink>
        <button @click="reviewWithAI"
          class="flex-1 text-center bg-white hover:bg-slate-50 border border-slate-200 text-slate-700 text-sm font-medium py-2.5 rounded-xl transition-colors">
          Review with AI
        </button>
      </div>

      <!-- Answer breakdown -->
      <div class="bg-white rounded-2xl border border-slate-200 overflow-hidden">
        <div class="flex items-center justify-between px-4 sm:px-6 py-4 border-b border-slate-200">
          <h2 class="font-semibold text-slate-900">Answer Review</h2>
          <div class="flex gap-1 bg-slate-100 rounded-lg p-1">
            <button @click="filter = 'all'"
              class="text-xs font-medium px-2.5 py-1 rounded-md transition-colors"
              :class="filter === 'all' ? 'bg-white text-slate-900 shadow-sm' : 'text-slate-500'">
              All ({{ result.details.length }})
            </button>
            <button @click="filter = 'incorrect'"
              class="text-xs font-medium px-2.5 py-1 rounded-md transition-colors"
              :class="filter === 'incorrect' ? 'bg-white text-red-600 shadow-sm' : 'text-slate-500'">
              Incorrect ({{ incorrectCount }})
            </button>
          </div>
        </div>

        <div v-if="!filteredDetails.length" class="px-6 py-10 text-center text-slate-400 text-sm">
          No incorrect answers - nice work!
        </div>

        <div v-else class="divide-y divide-slate-100">
          <div v-for="d in filteredDetails" :key="d.question_id" class="px-4 sm:px-6 py-5">
            <div class="flex items-start gap-3">
              <div class="w-7 h-7 rounded-lg flex items-center justify-center flex-shrink-0 text-xs font-bold mt-0.5"
                :class="d.is_correct ? 'bg-green-50 text-green-600' : 'bg-red-50 text-red-500'">
                {{ d._num }}
              </div>
              <div class="flex-1 min-w-0">
                <p class="text-sm font-medium text-slate-800 leading-relaxed">{{ d.question_text }}</p>

                <div class="mt-3 space-y-1.5">
                  <div v-for="opt in d.options" :key="opt.id"
                    class="flex items-center gap-2 text-sm px-3 py-2 rounded-lg border"
                    :class="optionClasses(d, opt)">
                    <span class="flex-1">{{ opt.text }}</span>
                    <span v-if="opt.correct" class="text-xs font-medium text-green-600 flex-shrink-0">Correct answer</span>
                    <span v-else-if="opt.id === d.selected_id" class="text-xs font-medium text-red-500 flex-shrink-0">Your answer</span>
                  </div>
                  <p v-if="!d.selected_id" class="text-xs text-slate-400 italic mt-1">No answer selected</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </template>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { RouterLink, useRoute, useRouter } from 'vue-router'
import { api } from '@/lib/api'
import Spinner from '@/components/Spinner.vue'

// Picked up by AIInstructorView on mount to auto-start a focused review of
// this exam's wrong answers — sessionStorage (not the route) because the
// content can be long and shouldn't survive past that one handoff.
const AI_REVIEW_STORAGE_KEY = 'vjet-ai-exam-review'

interface AnswerOption {
  id: string
  text: string
  correct: boolean
}

interface AnswerDetail {
  question_id: string
  question_text: string
  options: AnswerOption[]
  selected_id: string
  correct_id: string
  is_correct: boolean
}

interface ExamResult {
  exam_id: string
  score: number
  total_questions: number
  percentage: number
  pass_fail: string
  details: AnswerDetail[]
}

const route = useRoute()
const router = useRouter()
const loading = ref(true)
const result = ref<ExamResult | null>(null)
const filter = ref<'all' | 'incorrect'>('all')

onMounted(async () => {
  const res = await api.get(`/api/v1/exam/results/${route.params.id}`)
  result.value = res.data
  loading.value = false
})

// Cap how many wrong answers we hand to the AI in one go — a bad exam can
// have dozens, and the point is a focused review, not a wall of text.
const MAX_REVIEW_ITEMS = 15

function reviewWithAI() {
  const wrong = (result.value?.details ?? []).filter(d => !d.is_correct)
  if (!wrong.length) {
    router.push({ name: 'ai' })
    return
  }

  const items = wrong.slice(0, MAX_REVIEW_ITEMS).map((d, i) => {
    const correct = d.options.find(o => o.correct)
    const chosen = d.options.find(o => o.id === d.selected_id)
    return `${i + 1}. ${d.question_text}\n` +
      `My answer: ${chosen?.text ?? '(no answer selected)'}\n` +
      `Correct answer: ${correct?.text ?? '(unknown)'}`
  }).join('\n\n')

  const omitted = wrong.length - Math.min(wrong.length, MAX_REVIEW_ITEMS)
  const prompt = `I just took a practice exam and got these questions wrong. Can you go through them with me, one at a time, and explain why the correct answer is right?\n\n${items}` +
    (omitted > 0 ? `\n\n(${omitted} more incorrect answer${omitted > 1 ? 's' : ''} not shown here.)` : '')

  try {
    sessionStorage.setItem(AI_REVIEW_STORAGE_KEY, prompt)
  } catch {}
  router.push({ name: 'ai' })
}

const incorrectCount = computed(() =>
  result.value?.details.filter(d => !d.is_correct).length ?? 0
)

// Numbered details (stable question order as returned by the API), then filtered for display
const numberedDetails = computed(() =>
  (result.value?.details ?? []).map((d, i) => ({ ...d, _num: i + 1 }))
)

const filteredDetails = computed(() =>
  filter.value === 'incorrect'
    ? numberedDetails.value.filter(d => !d.is_correct)
    : numberedDetails.value
)

function optionClasses(d: AnswerDetail, opt: AnswerOption): string {
  if (opt.correct) return 'border-green-300 bg-green-50 text-green-800'
  if (opt.id === d.selected_id) return 'border-red-300 bg-red-50 text-red-700'
  return 'border-slate-200 text-slate-500'
}
</script>
