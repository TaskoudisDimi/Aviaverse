<template>
  <div class="p-6 max-w-2xl mx-auto space-y-6">
    <div>
      <h1 class="text-2xl font-bold text-white">Exam Simulator</h1>
      <p class="text-slate-400 text-sm mt-1">Configure and start a practice exam</p>
    </div>

    <div v-if="error" class="bg-red-900/30 border border-red-500/50 rounded-lg px-4 py-3 text-red-300 text-sm">
      {{ error }}
    </div>

    <form @submit.prevent="startExam" class="bg-navy-800 rounded-2xl p-6 border border-slate-700/50 space-y-5">
      <div>
        <label class="block text-sm font-medium text-slate-300 mb-1.5">Module</label>
        <select v-model="form.module_id" required
          class="w-full bg-navy-900 border border-slate-600 rounded-xl px-4 py-2.5 text-white
                 focus:outline-none focus:ring-2 focus:ring-aviation-500 text-sm">
          <option value="" disabled>Select a module…</option>
          <option v-for="m in modules" :key="m.id" :value="m.id">{{ m.code }} – {{ m.title }}</option>
        </select>
      </div>

      <div>
        <label class="block text-sm font-medium text-slate-300 mb-1.5">Licence type</label>
        <select v-model="form.licence_type" required
          class="w-full bg-navy-900 border border-slate-600 rounded-xl px-4 py-2.5 text-white
                 focus:outline-none focus:ring-2 focus:ring-aviation-500 text-sm">
          <option value="" disabled>Select licence…</option>
          <option value="B1.1">B1.1</option>
          <option value="B1.3">B1.3</option>
          <option value="B2">B2</option>
        </select>
      </div>

      <div class="grid grid-cols-2 gap-4">
        <div>
          <label class="block text-sm font-medium text-slate-300 mb-1.5">Questions</label>
          <select v-model.number="form.num_questions"
            class="w-full bg-navy-900 border border-slate-600 rounded-xl px-4 py-2.5 text-white
                   focus:outline-none focus:ring-2 focus:ring-aviation-500 text-sm">
            <option :value="10">10</option>
            <option :value="20">20</option>
            <option :value="30">30</option>
            <option :value="40">40</option>
          </select>
        </div>
        <div>
          <label class="block text-sm font-medium text-slate-300 mb-1.5">Time limit</label>
          <select v-model.number="form.time_limit_min"
            class="w-full bg-navy-900 border border-slate-600 rounded-xl px-4 py-2.5 text-white
                   focus:outline-none focus:ring-2 focus:ring-aviation-500 text-sm">
            <option :value="15">15 min</option>
            <option :value="30">30 min</option>
            <option :value="60">60 min</option>
            <option :value="90">90 min</option>
          </select>
        </div>
      </div>

      <button type="submit" :disabled="loading"
        class="w-full bg-aviation-600 hover:bg-aviation-500 disabled:opacity-50
               text-white font-medium py-3 rounded-xl transition-colors">
        {{ loading ? 'Preparing exam…' : 'Start Exam' }}
      </button>
    </form>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { api } from '@/lib/api'
import { useExamStore } from '@/stores/exam'

const router = useRouter()
const examStore = useExamStore()

interface Module { id: number; code: string; title: string }
const modules = ref<Module[]>([])
const loading = ref(false)
const error = ref('')

const form = ref({
  module_id: '' as number | '',
  licence_type: '',
  num_questions: 20,
  time_limit_min: 30,
})

onMounted(async () => {
  const res = await api.get('/api/v1/content/modules')
  modules.value = res.data
})

async function startExam() {
  loading.value = true
  error.value = ''
  try {
    const res = await api.post('/api/v1/exam/start', form.value)
    examStore.setSession(res.data)
    router.push(`/exam/${res.data.exam_id}`)
  } catch (e: unknown) {
    error.value = (e as { response?: { data?: { error?: string } } })?.response?.data?.error ?? 'Failed to start exam'
  } finally {
    loading.value = false
  }
}
</script>
