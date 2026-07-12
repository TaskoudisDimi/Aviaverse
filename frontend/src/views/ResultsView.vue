<template>
  <div class="p-6 max-w-3xl mx-auto space-y-6">
    <RouterLink to="/exam" class="text-sm text-slate-400 hover:text-white flex items-center gap-1">
      ‹ New exam
    </RouterLink>

    <div v-if="loading" class="flex justify-center py-12"><Spinner /></div>

    <template v-else-if="result">
      <!-- Score hero -->
      <div class="bg-navy-800 rounded-2xl p-8 border text-center"
        :class="result.pass_fail === 'PASS' ? 'border-green-500/40' : 'border-red-500/40'">
        <div class="text-5xl font-black mb-2"
          :class="result.pass_fail === 'PASS' ? 'text-green-400' : 'text-red-400'">
          {{ result.percentage.toFixed(0) }}%
        </div>
        <div class="text-lg font-bold mb-1"
          :class="result.pass_fail === 'PASS' ? 'text-green-300' : 'text-red-300'">
          {{ result.pass_fail === 'PASS' ? 'Passed' : 'Not Passed' }}
        </div>
        <p class="text-slate-400 text-sm">{{ result.score }} / {{ result.total_questions }} correct · 75% required to pass</p>
      </div>

      <!-- Quick actions -->
      <div class="flex gap-3">
        <RouterLink to="/exam"
          class="flex-1 text-center bg-aviation-600 hover:bg-aviation-500 text-white text-sm font-medium py-2.5 rounded-xl transition-colors">
          Retake Exam
        </RouterLink>
        <RouterLink to="/ai"
          class="flex-1 text-center bg-navy-800 hover:bg-navy-700 border border-slate-600 text-slate-300 text-sm font-medium py-2.5 rounded-xl transition-colors">
          Review with AI
        </RouterLink>
      </div>

      <!-- Answer breakdown -->
      <div class="bg-navy-800 rounded-2xl border border-slate-700/50 overflow-hidden">
        <div class="px-6 py-4 border-b border-slate-700/50">
          <h2 class="font-semibold text-white">Answer Breakdown</h2>
        </div>
        <div class="divide-y divide-slate-700/40">
          <div v-for="(d, i) in result.details" :key="d.question_id"
            class="px-6 py-4 flex items-center gap-4">
            <div class="w-8 h-8 rounded-lg flex items-center justify-center flex-shrink-0 text-xs font-bold"
              :class="d.is_correct ? 'bg-green-900/40 text-green-400' : 'bg-red-900/40 text-red-400'">
              {{ i + 1 }}
            </div>
            <div class="flex-1 min-w-0">
              <p class="text-xs text-slate-400">Question {{ i + 1 }}</p>
              <p class="text-sm text-slate-300 mt-0.5">
                {{ d.is_correct ? 'Correct' : 'Incorrect' }}
                <span v-if="!d.is_correct" class="text-slate-500"> · Selected: {{ d.selected_id || 'no answer' }}</span>
              </p>
            </div>
            <span v-if="d.is_correct" class="text-green-400 text-lg">✓</span>
            <span v-else class="text-red-400 text-lg">✗</span>
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
