<template>
  <div class="p-6 max-w-4xl mx-auto space-y-6">
    <div v-if="loading" class="flex justify-center py-12"><Spinner /></div>

    <template v-else-if="module">
      <RouterLink to="/modules"
        class="text-sm text-slate-400 hover:text-aviation-300 flex items-center gap-1 transition-colors">
        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"/>
        </svg>
        All modules
      </RouterLink>

      <!-- Module header -->
      <div class="bg-navy-800 border border-slate-700/50 rounded-2xl overflow-hidden">
        <div class="h-1.5 w-full bg-gradient-to-r from-aviation-600 to-aviation-400" />
        <div class="p-6">
          <div class="flex items-start justify-between gap-4">
            <div>
              <span class="text-xs font-bold text-aviation-400 bg-aviation-900/30 px-2 py-0.5 rounded-lg">
                {{ module.code }}
              </span>
              <h1 class="text-2xl font-bold text-white mt-2">{{ module.title }}</h1>
            </div>
            <div class="flex gap-2 flex-wrap justify-end shrink-0">
              <span v-for="lt in module.licence_types" :key="lt"
                class="text-xs text-slate-400 border border-slate-600 px-2 py-0.5 rounded">{{ lt }}</span>
            </div>
          </div>
          <div class="mt-3 flex items-center gap-4 text-sm text-slate-400">
            <span>{{ module.subjects.length }} subject{{ module.subjects.length !== 1 ? 's' : '' }}</span>
          </div>
        </div>
      </div>

      <!-- Subjects list -->
      <div class="space-y-2">
        <RouterLink
          v-for="(s, idx) in module.subjects" :key="s.id"
          :to="`/subjects/${s.id}`"
          class="flex items-center gap-4 p-4 bg-navy-800 border border-slate-700/50 rounded-xl
                 hover:border-aviation-500/50 hover:bg-navy-700 transition-all group">

          <!-- Number badge -->
          <div class="w-8 h-8 rounded-lg bg-aviation-900/40 border border-aviation-500/20
                      flex items-center justify-center shrink-0
                      group-hover:border-aviation-500/40 transition-colors">
            <span class="text-xs font-mono text-aviation-400">{{ String(idx + 1).padStart(2, '0') }}</span>
          </div>

          <div class="flex-1 min-w-0">
            <div class="flex items-center gap-2">
              <span class="text-xs font-mono text-slate-500">{{ s.code }}</span>
            </div>
            <span class="text-sm font-medium text-white group-hover:text-aviation-300 transition-colors block truncate">
              {{ s.title }}
            </span>
          </div>

          <svg class="w-4 h-4 text-slate-500 group-hover:text-aviation-400 transition-colors shrink-0"
            fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"/>
          </svg>
        </RouterLink>
      </div>

      <!-- AI quick-launch -->
      <div class="bg-aviation-900/20 border border-aviation-500/30 rounded-2xl p-5 flex items-center justify-between gap-4">
        <div>
          <p class="font-medium text-white">Study this module with AI</p>
          <p class="text-sm text-slate-400 mt-0.5">Get explanations, worked examples, or an oral exam on {{ module.title }}.</p>
        </div>
        <RouterLink :to="{ name: 'ai', query: { subject: module.title } }"
          class="flex-shrink-0 bg-aviation-600 hover:bg-aviation-500 text-white text-sm font-medium px-4 py-2 rounded-xl transition-colors">
          Ask AI
        </RouterLink>
      </div>
    </template>

    <div v-else class="text-center py-12 text-slate-400">Module not found.</div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { RouterLink, useRoute } from 'vue-router'
import { api } from '@/lib/api'
import Spinner from '@/components/Spinner.vue'

const route = useRoute()
const loading = ref(true)
const module = ref<{
  id: number
  code: string
  title: string
  licence_types: string[]
  subjects: { id: number; code: string; title: string }[]
} | null>(null)

onMounted(async () => {
  const res = await api.get(`/api/v1/content/modules/${route.params.id}`)
  module.value = res.data
  loading.value = false
})
</script>
