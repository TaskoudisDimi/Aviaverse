<template>
  <div class="p-4 sm:p-6 max-w-2xl mx-auto space-y-6">
    <div>
      <h1 class="text-2xl font-bold text-white">Exam Simulator</h1>
      <p class="text-slate-300 text-sm mt-1">Configure and start a practice exam</p>
    </div>

    <div v-if="error" class="bg-red-50 border border-red-200 rounded-lg px-4 py-3 text-red-600 text-sm">
      {{ error }}
    </div>

    <form @submit.prevent="startExam" class="bg-white rounded-2xl p-5 sm:p-6 border border-slate-200 space-y-5">
      <div>
        <label class="block text-sm font-medium text-slate-700 mb-1.5">Licence type</label>
        <div class="relative">
          <select v-model="form.licence_type" required
            class="w-full appearance-none bg-none bg-white border border-slate-300 rounded-xl pl-4 pr-9 py-2.5 text-slate-900
                   focus:outline-none focus:ring-2 focus:ring-aviation-500 text-sm">
            <option value="" disabled>Select licence…</option>
            <option value="B1">B1</option>
            <option value="B2">B2</option>
          </select>
          <svg class="pointer-events-none absolute right-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400"
            fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
          </svg>
        </div>
      </div>

      <div>
        <label class="block text-sm font-medium text-slate-700 mb-1.5">Module</label>
        <div class="relative">
          <select v-model="form.module_id" required :disabled="!form.licence_type"
            class="w-full appearance-none bg-none bg-white border border-slate-300 rounded-xl pl-4 pr-9 py-2.5 text-slate-900
                   focus:outline-none focus:ring-2 focus:ring-aviation-500 text-sm disabled:opacity-50">
            <option value="" disabled>{{ form.licence_type ? 'Select a module…' : 'Select a licence first…' }}</option>
            <option v-for="m in availableModules" :key="m.id" :value="m.id">{{ m.code }} – {{ m.title }}</option>
          </select>
          <svg class="pointer-events-none absolute right-3 top-1/2 -translate-y-1/2 w-4 h-4 text-slate-400"
            fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
          </svg>
        </div>
        <p v-if="form.licence_type && !availableModules.length" class="text-xs text-slate-500 mt-1.5">
          No modules available for {{ form.licence_type }}.
        </p>
        <p v-else-if="lockedModuleCode" class="text-xs text-slate-500 mt-1.5">
          Your free plan is locked to module {{ lockedModuleCode }}.
          <RouterLink to="/pricing" class="text-aviation-600 hover:text-aviation-700 font-medium">Upgrade</RouterLink>
          to access other modules.
        </p>
        <p v-else-if="allowedModuleCodes" class="text-xs text-slate-500 mt-1.5">
          Your free plan can study from modules 1-10, but gives you <strong>one</strong> module
          total - whichever you pick below (to study or to test) is permanent unless you
          <RouterLink to="/pricing" class="text-aviation-600 hover:text-aviation-700 font-medium">upgrade</RouterLink>.
        </p>
      </div>

      <div v-if="form.module_id && form.licence_type" class="space-y-2">
        <label class="block text-sm font-medium text-slate-700">Format</label>

        <button type="button" @click="mode = 'official'"
          class="w-full text-left bg-slate-50 border rounded-xl p-4 transition-colors"
          :class="mode === 'official' ? 'border-aviation-400 ring-1 ring-aviation-400' : 'border-slate-200 hover:border-slate-300'">
          <p class="text-xs text-slate-400 uppercase tracking-wide mb-1">Official EASA format</p>
          <p class="text-slate-900 font-medium">
            {{ examFormat.question_count }} questions · {{ examFormat.time_limit_min }} minutes
          </p>
          <p class="text-xs text-slate-400 mt-1">Matches the official EASA Part-66 format for this module and licence.</p>
        </button>

        <button type="button" @click="mode = 'quick'"
          class="w-full text-left bg-slate-50 border rounded-xl p-4 transition-colors"
          :class="mode === 'quick' ? 'border-aviation-400 ring-1 ring-aviation-400' : 'border-slate-200 hover:border-slate-300'">
          <p class="text-xs text-slate-400 uppercase tracking-wide mb-1">Quick test</p>
          <p class="text-slate-900 font-medium">{{ QUICK_TEST.question_count }} questions · {{ QUICK_TEST.time_limit_min }} minutes</p>
          <p class="text-xs text-slate-400 mt-1">A short, random set of questions — good for a quick review.</p>
        </button>
      </div>

      <button type="submit" :disabled="loading"
        class="w-full bg-aviation-500 hover:bg-aviation-600 disabled:opacity-50
               text-white font-medium py-3 rounded-xl transition-colors">
        {{ loading ? 'Preparing exam…' : 'Start Exam' }}
      </button>
    </form>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted, watch } from 'vue'
import { RouterLink, useRouter } from 'vue-router'
import { api } from '@/lib/api'
import { useExamStore } from '@/stores/exam'
import { useAuthStore } from '@/stores/auth'

const router = useRouter()
const examStore = useExamStore()
const authStore = useAuthStore()

interface Module { id: number; code: string; title: string; licence_types: string[] }
interface ExamFormat { module_code: string; licence_type: string; question_count: number; time_limit_min: number }

const modules = ref<Module[]>([])
const examFormats = ref<ExamFormat[]>([])
const loading = ref(false)
const error = ref('')

const form = ref({
  module_id: '' as number | '',
  licence_type: '',
  num_questions: 20,
  time_limit_min: 30,
})

// null allowed_module_codes means unrestricted (paid plans); an array means
// only those module codes are selectable (the free plan).
const allowedModuleCodes = computed(() => authStore.user?.plan?.allowed_module_codes ?? null)

// Free-tier users get a single module total — whichever they studied or
// tested on first (set server-side on first access, surfaced here via
// /auth/me). Unset until they've actually opened one.
const lockedModuleCode = computed(() =>
  allowedModuleCodes.value ? authStore.user?.locked_module_code ?? null : null
)

const availableModules = computed(() =>
  modules.value
    .filter(m => m.licence_types.includes(form.value.licence_type))
    .filter(m => !allowedModuleCodes.value || allowedModuleCodes.value.includes(m.code))
    .filter(m => !lockedModuleCode.value || m.code === lockedModuleCode.value)
)

// Falls back to a sensible default if a module+licence pairing has no
// official format on file yet, rather than leaving the form stuck.
const DEFAULT_FORMAT = { question_count: 20, time_limit_min: 30 }
const QUICK_TEST = { question_count: 10, time_limit_min: 15 }

const mode = ref<'official' | 'quick'>('official')

const examFormat = computed(() => {
  const mod = modules.value.find(m => m.id === form.value.module_id)
  if (!mod) return DEFAULT_FORMAT
  const match = examFormats.value.find(
    f => f.module_code === mod.code && f.licence_type === form.value.licence_type
  )
  return match ?? DEFAULT_FORMAT
})

watch([examFormat, mode], ([f, m]) => {
  const chosen = m === 'quick' ? QUICK_TEST : f
  form.value.num_questions = chosen.question_count
  form.value.time_limit_min = chosen.time_limit_min
}, { immediate: true })

watch(() => form.value.licence_type, () => {
  if (!availableModules.value.some(m => m.id === form.value.module_id)) {
    form.value.module_id = ''
  }
})

onMounted(async () => {
  const [modulesRes, formatsRes] = await Promise.all([
    api.get('/api/v1/content/modules'),
    api.get('/api/v1/content/exam-formats'),
  ])
  modules.value = modulesRes.data
  examFormats.value = formatsRes.data
})

async function startExam() {
  loading.value = true
  error.value = ''
  try {
    const res = await api.post('/api/v1/exam/start', { ...form.value, mode: mode.value })
    examStore.setSession(res.data)
    // The free plan's module lock may have just been set for the first
    // time by this call — refresh so the UI reflects it immediately.
    if (allowedModuleCodes.value && !lockedModuleCode.value) {
      authStore.fetchMe().catch(() => {})
    }
    router.push(`/exam/${res.data.exam_id}`)
  } catch (e: unknown) {
    error.value = (e as { response?: { data?: { error?: string } } })?.response?.data?.error ?? 'Failed to start exam'
  } finally {
    loading.value = false
  }
}
</script>
