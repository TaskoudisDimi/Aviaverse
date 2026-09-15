<template>
  <div class="p-4 sm:p-6 max-w-3xl mx-auto space-y-6">
    <RouterLink to="/exam" class="text-sm text-slate-500 hover:text-slate-900 flex items-center gap-1">
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
        <RouterLink to="/ai"
          class="flex-1 text-center bg-white hover:bg-slate-50 border border-slate-200 text-slate-700 text-sm font-medium py-2.5 rounded-xl transition-colors">
          Review with AI
        </RouterLink>
      </div>

      <!-- Answer breakdown -->
      <div class="bg-white rounded-2xl border border-slate-200 overflow-hidden">
        <div class="px-4 sm:px-6 py-4 border-b border-slate-200">
          <h2 class="font-semibold text-slate-900">Answer Breakdown</h2>
        </div>
        <div class="divide-y divide-slate-100">
          <div v-for="(d, i) in result.details" :key="d.question_id"
            class="px-4 sm:px-6 py-4 flex items-center gap-4">
            <div class="w-8 h-8 rounded-lg flex items-center justify-center flex-shrink-0 text-xs font-bold"
              :class="d.is_correct ? 'bg-green-50 text-green-600' : 'bg-red-50 text-red-500'">
              {{ i + 1 }}
            </div>
            <div class="flex-1 min-w-0">
              <p class="text-xs text-slate-400">Question {{ i + 1 }}</p>
              <p class="text-sm text-slate-600 mt-0.5">
                {{ d.is_correct ? 'Correct' : 'Incorrect' }}
                <span v-if="!d.is_correct" class="text-slate-400"> · Selected: {{ d.selected_id || 'no answer' }}</span>
              </p>
            </div>
            <span v-if="d.is_correct" class="text-green-500 text-lg">✓</span>
            <span v-else class="text-red-500 text-lg">✗</span>
          </div>
        </div>
      </div>
    </template>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { RouterLink, useRoute } from 'vue-router'
import { api } from '@/lib/api'
import Spinner from '@/components/Spinner.vue'

interface AnswerDetail {
  question_id: string
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
const loading = ref(true)
const result = ref<ExamResult | null>(null)

onMounted(async () => {
  const res = await api.get(`/api/v1/exam/results/${route.params.id}`)
  result.value = res.data
  loading.value = false
})
</script>
