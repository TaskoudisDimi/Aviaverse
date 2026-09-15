<template>
  <div class="p-6 max-w-7xl mx-auto space-y-6">
    <!-- Hero -->
    <div class="relative overflow-hidden rounded-2xl bg-gradient-to-br from-aviation-700 via-aviation-600 to-aviation-500 px-6 py-8 sm:px-10 sm:py-10 text-white">
      <svg class="absolute -right-10 -top-10 w-64 h-64 text-white/10" fill="currentColor" viewBox="0 0 24 24">
        <path d="M21 16v-2l-8-5V3.5a1.5 1.5 0 0 0-3 0V9l-8 5v2l8-2.5V19l-2 1.5V22l3.5-1 3.5 1v-1.5L13 19v-5.5z"/>
      </svg>
      <div class="relative flex flex-col sm:flex-row sm:items-end sm:justify-between gap-4">
        <div>
          <p class="text-xs font-medium uppercase tracking-wider text-aviation-100">For aircraft engineers. A brighter tomorrow.</p>
          <h1 class="text-2xl sm:text-3xl font-bold mt-2">Welcome back, {{ auth.user?.full_name }}</h1>
          <p class="text-aviation-100 text-sm mt-1">Continue your aviation maintenance journey</p>
        </div>
        <p class="text-sm italic text-aviation-100 sm:max-w-xs sm:text-right">"Better engineers keep the world flying."</p>
      </div>
    </div>

    <div v-if="loading" class="flex justify-center py-12">
      <Spinner />
    </div>

    <template v-else-if="stats">
      <!-- KPI row -->
      <div class="grid grid-cols-2 lg:grid-cols-4 gap-4">
        <StatCard label="Study Hours" :value="stats.total_study_hours.toFixed(1)" unit="hrs" color="blue" />
        <StatCard label="Module Coverage" :value="stats.completion_percent.toFixed(0)" unit="%" color="purple" />
        <StatCard label="Avg. Score" :value="stats.average_score.toFixed(0)" unit="%" color="green" />
        <StatCard label="Exam Readiness" :value="stats.exam_readiness_score.toFixed(0)" unit="%" color="orange" />
      </div>

      <!-- Readiness + AI Instructor -->
      <div class="grid lg:grid-cols-3 gap-4">
        <div class="lg:col-span-2 bg-white rounded-2xl p-6 border border-slate-200">
          <div class="flex justify-between items-center mb-4">
            <h2 class="font-semibold text-slate-900">Exam Readiness</h2>
            <span class="text-sm font-semibold px-2.5 py-1 rounded-full" :class="readinessPill">
              {{ stats.exam_readiness_score.toFixed(0) }}% {{ stats.exam_readiness_score >= 50 ? '↑' : '' }}
            </span>
          </div>
          <p class="text-xs text-slate-500 mb-4">{{ readinessLabel }}</p>
          <div class="w-full bg-slate-100 rounded-full h-3 mb-5">
            <div class="h-3 rounded-full transition-all duration-700" :class="readinessBg"
              :style="{ width: stats.exam_readiness_score + '%' }" />
          </div>
          <div class="flex items-center justify-between">
            <div v-for="(step, i) in readinessSteps" :key="step.label" class="flex-1 flex items-center">
              <div class="flex flex-col items-center text-center flex-1">
                <div class="w-6 h-6 rounded-full flex items-center justify-center border-2" :class="stepClasses(step.state)">
                  <svg v-if="step.state === 'complete'" class="w-3.5 h-3.5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="3">
                    <path stroke-linecap="round" stroke-linejoin="round" d="m4.5 12.75 6 6 9-13.5" />
                  </svg>
                </div>
                <p class="text-xs font-medium text-slate-700 mt-2">{{ step.label }}</p>
                <p class="text-[11px] text-slate-400">{{ stepStatusLabel(step.state) }}</p>
              </div>
              <div v-if="i < readinessSteps.length - 1" class="h-0.5 flex-1 -mt-6"
                :class="step.state === 'complete' ? 'bg-green-400' : 'bg-slate-200'" />
            </div>
          </div>
        </div>

        <div class="bg-navy-900 rounded-2xl p-6 text-white flex flex-col justify-between">
          <div>
            <div class="w-9 h-9 rounded-xl bg-white/10 flex items-center justify-center mb-3">
              <svg class="w-5 h-5 text-aviation-300" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5">
                <path stroke-linecap="round" stroke-linejoin="round" d="M9.813 15.904 9 18.75l-.813-2.846a4.5 4.5 0 0 0-3.09-3.09L2.25 12l2.846-.813a4.5 4.5 0 0 0 3.09-3.09L9 5.25l.813 2.846a4.5 4.5 0 0 0 3.09 3.09L15.75 12l-2.846.813a4.5 4.5 0 0 0-3.09 3.09Z"/>
              </svg>
            </div>
            <h2 class="font-semibold">AI Instructor</h2>
            <p class="text-xs text-slate-400 mt-0.5">Ask questions instantly</p>
            <p class="text-sm text-slate-300 mt-3">Get explanations, solve problems, and learn from your personal AI aviation instructor.</p>
          </div>
          <RouterLink to="/ai" class="mt-5 inline-flex items-center justify-center gap-1.5 bg-aviation-500 hover:bg-aviation-400 transition-colors text-white text-sm font-semibold px-4 py-2.5 rounded-xl">
            Start a Chat
            <span aria-hidden="true">→</span>
          </RouterLink>
        </div>
      </div>

      <!-- Weak / Strong subjects -->
      <div class="grid lg:grid-cols-2 gap-4">
        <SubjectList title="Areas to Review" :subjects="stats.weak_subjects" variant="weak" />
        <SubjectList title="Strong Subjects" :subjects="stats.strong_subjects" variant="strong" />
      </div>

      <!-- Career tools -->
      <div class="bg-white rounded-2xl p-6 border border-slate-200">
        <h2 class="font-semibold text-slate-900 mb-1">Career Tools</h2>
        <p class="text-xs text-slate-500 mb-4">Build your career in aviation</p>
        <div class="grid sm:grid-cols-3 gap-3">
          <RouterLink to="/sessions" class="flex flex-col items-center text-center gap-2 rounded-xl border border-slate-200 p-4 hover:border-aviation-300 hover:bg-aviation-50/40 transition-colors">
            <div class="w-9 h-9 rounded-xl bg-aviation-50 flex items-center justify-center">
              <svg class="w-5 h-5 text-aviation-600" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5">
                <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 14.25v-2.625a3.375 3.375 0 0 0-3.375-3.375h-1.5A1.125 1.125 0 0 1 13.5 7.125v-1.5a3.375 3.375 0 0 0-3.375-3.375H8.25m0 12.75h7.5m-7.5 3H12M10.5 2.25H5.625c-.621 0-1.125.504-1.125 1.125v17.25c0 .621.504 1.125 1.125 1.125h12.75c.621 0 1.125-.504 1.125-1.125V11.25a9 9 0 0 0-9-9Z"/>
              </svg>
            </div>
            <p class="text-sm font-medium text-slate-800">CV Review</p>
            <p class="text-xs text-slate-500">Get expert feedback</p>
          </RouterLink>
          <RouterLink to="/sessions" class="flex flex-col items-center text-center gap-2 rounded-xl border border-slate-200 p-4 hover:border-aviation-300 hover:bg-aviation-50/40 transition-colors">
            <div class="w-9 h-9 rounded-xl bg-aviation-50 flex items-center justify-center">
              <svg class="w-5 h-5 text-aviation-600" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5">
                <path stroke-linecap="round" stroke-linejoin="round" d="M13.19 8.688a4.5 4.5 0 0 1 1.242 7.244l-4.5 4.5a4.5 4.5 0 0 1-6.364-6.364l1.757-1.757m13.35-.622 1.757-1.757a4.5 4.5 0 0 0-6.364-6.364l-4.5 4.5a4.5 4.5 0 0 0 1.242 7.244"/>
              </svg>
            </div>
            <p class="text-sm font-medium text-slate-800">LinkedIn Review</p>
            <p class="text-xs text-slate-500">Optimise your profile</p>
          </RouterLink>
          <RouterLink to="/sessions" class="flex flex-col items-center text-center gap-2 rounded-xl border border-slate-200 p-4 hover:border-aviation-300 hover:bg-aviation-50/40 transition-colors">
            <div class="w-9 h-9 rounded-xl bg-aviation-50 flex items-center justify-center">
              <svg class="w-5 h-5 text-aviation-600" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5">
                <path stroke-linecap="round" stroke-linejoin="round" d="M18 18.72a9.094 9.094 0 0 0 3.741-.479 3 3 0 0 0-4.682-2.72m.94 3.198.001.031c0 .225-.012.447-.037.666A11.944 11.944 0 0 1 12 21c-2.17 0-4.207-.576-5.963-1.584A6.062 6.062 0 0 1 6 18.719m12 0a5.971 5.971 0 0 0-.941-3.197m0 0A5.995 5.995 0 0 0 12 12.75a5.995 5.995 0 0 0-5.058 2.772m0 0a3 3 0 0 0-4.681 2.72 8.986 8.986 0 0 0 3.74.477m.94-3.197a5.971 5.971 0 0 0-.94 3.197M15 6.75a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm6 3a2.25 2.25 0 1 1-4.5 0 2.25 2.25 0 0 1 4.5 0Zm-13.5 0a2.25 2.25 0 1 1-4.5 0 2.25 2.25 0 0 1 4.5 0Z"/>
              </svg>
            </div>
            <p class="text-sm font-medium text-slate-800">Job Coaching</p>
            <p class="text-xs text-slate-500">Interview prep &amp; career guidance</p>
          </RouterLink>
        </div>
      </div>

      <!-- Recent exams + Live training -->
      <div class="grid lg:grid-cols-3 gap-4">
        <div class="lg:col-span-2 bg-white rounded-2xl p-6 border border-slate-200">
          <div class="flex items-center justify-between mb-4">
            <h2 class="font-semibold text-slate-900">Recent Exams</h2>
            <RouterLink to="/exam" class="text-xs font-medium text-aviation-600 hover:underline">See all →</RouterLink>
          </div>
          <div v-if="!stats.recent_exams.length" class="text-slate-400 text-sm">No exams taken yet.</div>
          <div v-else class="space-y-3">
            <div v-for="ex in stats.recent_exams" :key="ex.id"
              class="flex items-center justify-between py-2 border-b border-slate-100 last:border-0">
              <div>
                <p class="text-sm font-medium text-slate-800">{{ ex.module_code }} – {{ ex.module_title }}</p>
                <p class="text-xs text-slate-400">{{ formatDate(ex.started_at) }}</p>
              </div>
              <div class="flex items-center gap-3">
                <span class="text-sm font-semibold text-slate-900">{{ ex.percentage.toFixed(0) }}%</span>
                <span class="text-xs font-medium px-2 py-0.5 rounded-full"
                  :class="ex.pass_fail === 'PASS' ? 'bg-green-50 text-green-700' : 'bg-red-50 text-red-600'">
                  {{ ex.pass_fail }}
                </span>
                <RouterLink :to="`/results/${ex.id}`" class="text-xs text-aviation-600 hover:underline">Details</RouterLink>
              </div>
            </div>
          </div>
        </div>

        <div class="bg-white rounded-2xl p-6 border border-slate-200 flex flex-col justify-between">
          <div>
            <h2 class="font-semibold text-slate-900 mb-1">Live Training</h2>
            <p class="text-xs text-slate-500">1-to-1 tutoring, module walkthroughs, exam prep &amp; flexible scheduling.</p>
          </div>
          <RouterLink to="/sessions" class="mt-4 inline-flex items-center justify-center gap-1.5 bg-slate-900 hover:bg-slate-800 transition-colors text-white text-sm font-semibold px-4 py-2.5 rounded-xl">
            Book a Session
          </RouterLink>
        </div>
      </div>

      <!-- Next goals -->
      <div v-if="stats.next_goals.length" class="bg-white rounded-2xl p-6 border border-slate-200">
        <h2 class="font-semibold text-slate-900 mb-3">Next Goals</h2>
        <ul class="space-y-2">
          <li v-for="goal in stats.next_goals" :key="goal" class="flex items-start gap-2 text-sm text-slate-600">
            <span class="text-aviation-500 mt-0.5">›</span>
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

const readinessBg = computed(() => {
  const s = stats.value?.exam_readiness_score ?? 0
  if (s >= 75) return 'bg-green-500'
  if (s >= 50) return 'bg-orange-400'
  return 'bg-red-500'
})

const readinessPill = computed(() => {
  const s = stats.value?.exam_readiness_score ?? 0
  if (s >= 75) return 'bg-green-50 text-green-700'
  if (s >= 50) return 'bg-orange-50 text-orange-600'
  return 'bg-red-50 text-red-600'
})

const readinessLabel = computed(() => {
  const s = stats.value?.exam_readiness_score ?? 0
  if (s >= 75) return 'Ready for examination'
  if (s >= 50) return "You're on track! Keep practicing to improve your score."
  return 'More study needed before attempting the exam'
})

type StepState = 'complete' | 'progress' | 'pending'

// Derived purely from real progress/exam data (completion %, exam counts) —
// there's no separate "curriculum stage" concept in the backend yet, so this
// maps the existing numbers onto the 4-stage visual used in the mockup.
const readinessSteps = computed<{ label: string; state: StepState }[]>(() => {
  const completion = stats.value?.completion_percent ?? 0
  const totalExams = stats.value?.total_exams ?? 0
  const passedExams = stats.value?.passed_exams ?? 0

  const basics: StepState = completion >= 20 ? 'complete' : completion > 0 ? 'progress' : 'pending'
  const core: StepState = completion >= 50 ? 'complete' : completion >= 20 ? 'progress' : 'pending'
  const advanced: StepState = completion >= 90 ? 'complete' : completion >= 50 ? 'progress' : 'pending'
  const mocks: StepState = passedExams > 0 ? 'complete' : totalExams > 0 ? 'progress' : 'pending'

  return [
    { label: 'Basics', state: basics },
    { label: 'Core Modules', state: core },
    { label: 'Advanced', state: advanced },
    { label: 'Mock Exams', state: mocks },
  ]
})

function stepClasses(state: StepState) {
  if (state === 'complete') return 'bg-green-500 border-green-500 text-white'
  if (state === 'progress') return 'border-aviation-400 text-aviation-500'
  return 'border-slate-300'
}

function stepStatusLabel(state: StepState) {
  if (state === 'complete') return 'Complete'
  if (state === 'progress') return 'In Progress'
  return 'Not Started'
}

function formatDate(iso: string) {
  return new Date(iso).toLocaleDateString('en-GB', { day: 'numeric', month: 'short', year: 'numeric' })
}
</script>
