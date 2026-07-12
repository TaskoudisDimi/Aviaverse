<template>
  <div class="p-6 max-w-7xl mx-auto space-y-6">
    <div>
      <h1 class="text-2xl font-bold text-white">Dashboard</h1>
      <p class="text-slate-400 text-sm mt-1">Welcome back, {{ auth.user?.full_name }}</p>
    </div>

    <div v-if="loading" class="flex justify-center py-12">
      <Spinner />
    </div>

    <template v-else-if="stats">
      <!-- KPI row -->
      <div class="grid grid-cols-2 lg:grid-cols-4 gap-4">
        <StatCard label="Study Hours" :value="stats.total_study_hours.toFixed(1)" unit="hrs" color="blue" />
        <StatCard label="Coverage" :value="stats.completion_percent.toFixed(0)" unit="%" color="purple" />
        <StatCard label="Avg. Score" :value="stats.average_score.toFixed(0)" unit="%" color="green" />
        <StatCard label="Exam Readiness" :value="stats.exam_readiness_score.toFixed(0)" unit="%" color="orange" />
      </div>

      <!-- Readiness bar -->
      <div class="bg-navy-800 rounded-2xl p-6 border border-slate-700/50">
        <div class="flex justify-between items-center mb-3">
          <h2 class="font-semibold text-white">Exam Readiness</h2>
          <span class="text-2xl font-bold" :class="readinessColor">{{ stats.exam_readiness_score.toFixed(0) }}%</span>
        </div>
        <div class="w-full bg-slate-700 rounded-full h-3">
          <div class="h-3 rounded-full transition-all duration-700" :class="readinessBg"
            :style="{ width: stats.exam_readiness_score + '%' }" />
        </div>
        <p class="text-xs text-slate-400 mt-2">{{ readinessLabel }}</p>
      </div>

      <!-- Weak / Strong subjects -->
      <div class="grid lg:grid-cols-2 gap-4">
        <SubjectList title="Areas to Review" :subjects="stats.weak_subjects" variant="weak" />
        <SubjectList title="Strong Subjects" :subjects="stats.strong_subjects" variant="strong" />
      </div>

      <!-- Recent exams -->
      <div class="bg-navy-800 rounded-2xl p-6 border border-slate-700/50">
        <h2 class="font-semibold text-white mb-4">Recent Exams</h2>
        <div v-if="!stats.recent_exams.length" class="text-slate-500 text-sm">No exams taken yet.</div>
        <div v-else class="space-y-3">
          <div v-for="ex in stats.recent_exams" :key="ex.id"
            class="flex items-center justify-between py-2 border-b border-slate-700/40 last:border-0">
            <div>
              <p class="text-sm font-medium text-white">{{ ex.module_code }} – {{ ex.module_title }}</p>
              <p class="text-xs text-slate-400">{{ formatDate(ex.started_at) }}</p>
            </div>
            <div class="flex items-center gap-3">
              <span class="text-sm font-semibold text-white">{{ ex.percentage.toFixed(0) }}%</span>
              <span class="text-xs font-medium px-2 py-0.5 rounded-full"
                :class="ex.pass_fail === 'PASS' ? 'bg-green-900/40 text-green-400' : 'bg-red-900/40 text-red-400'">
                {{ ex.pass_fail }}
              </span>
              <RouterLink :to="`/results/${ex.id}`" class="text-xs text-aviation-400 hover:underline">Details</RouterLink>
            </div>
          </div>
        </div>
      </div>

      <!-- Next goals -->
      <div v-if="stats.next_goals.length" class="bg-navy-800 rounded-2xl p-6 border border-slate-700/50">
        <h2 class="font-semibold text-white mb-3">Next Goals</h2>
        <ul class="space-y-2">
          <li v-for="goal in stats.next_goals" :key="goal" class="flex items-start gap-2 text-sm text-slate-300">
            <span class="text-aviation-400 mt-0.5">›</span>
            {{ goal }}
          </li>
        </ul>
      </div>
    </template>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { RouterLink } from 'vue-router'
import { useAuthStore } from '@/stores/auth'
import { api } from '@/lib/api'
import Spinner from '@/components/Spinner.vue'
import StatCard from '@/components/StatCard.vue'
import SubjectList from '@/components/SubjectList.vue'

const auth = useAuthStore()
const loading = ref(true)
const stats = ref<DashboardStats | null>(null)

interface SubjectScore {
  subject_id: number
  subject_code: string
  subject_title: string
  module_code: string
  percentage: number
  total_answers: number
}

interface DashboardStats {
  total_study_hours: number
  completion_percent: number
  exam_readiness_score: number
  total_exams: number
  passed_exams: number
  average_score: number
  strong_subjects: SubjectScore[]
  weak_subjects: SubjectScore[]
  recent_exams: { id: string; module_code: string; module_title: string; percentage: number; pass_fail: string; started_at: string }[]
  next_goals: string[]
}

onMounted(async () => {
  try {
    const res = await api.get('/api/v1/progress/dashboard')
    stats.value = res.data
  } finally {
    loading.value = false
  }
})

const readinessColor = computed(() => {
  const s = stats.value?.exam_readiness_score ?? 0
  if (s >= 75) return 'text-green-400'
  if (s >= 50) return 'text-yellow-400'
  return 'text-red-400'
})

const readinessBg = computed(() => {
  const s = stats.value?.exam_readiness_score ?? 0
  if (s >= 75) return 'bg-green-500'
  if (s >= 50) return 'bg-yellow-500'
  return 'bg-red-500'
})

const readinessLabel = computed(() => {
  const s = stats.value?.exam_readiness_score ?? 0
  if (s >= 75) return 'Ready for examination'
  if (s >= 50) return 'Making good progress — keep studying'
  return 'More study needed before attempting the exam'
})

function formatDate(iso: string) {
  return new Date(iso).toLocaleDateString('en-GB', { day: 'numeric', month: 'short', year: 'numeric' })
}
</script>
