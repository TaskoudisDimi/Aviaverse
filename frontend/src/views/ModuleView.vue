<template>
  <div class="p-4 sm:p-6 max-w-4xl mx-auto space-y-6">
    <div v-if="loading" class="flex justify-center py-12"><Spinner /></div>

    <template v-else-if="module">
      <RouterLink to="/modules"
        class="text-sm text-slate-500 hover:text-aviation-600 flex items-center gap-1 transition-colors">
        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"/>
        </svg>
        All modules
      </RouterLink>

      <!-- Module header -->
      <div class="bg-white border border-slate-200 rounded-2xl overflow-hidden">
        <div class="h-1.5 w-full bg-gradient-to-r from-aviation-600 to-aviation-400" />
        <div class="p-5 sm:p-6">
          <div class="flex flex-col sm:flex-row sm:items-start justify-between gap-3">
            <div>
              <span class="text-xs font-bold text-aviation-700 bg-aviation-50 px-2 py-0.5 rounded-lg">
                {{ module.code }}
              </span>
              <h1 class="text-2xl font-bold text-slate-900 mt-2">{{ module.title }}</h1>
            </div>
            <div class="flex gap-2 flex-wrap sm:justify-end shrink-0">
              <span v-for="lt in module.licence_types" :key="lt"
                class="text-xs text-slate-500 border border-slate-200 px-2 py-0.5 rounded">{{ lt }}</span>
            </div>
          </div>
          <div class="mt-3 flex items-center gap-4 text-sm text-slate-500">
            <span>{{ module.subjects.length }} subject{{ module.subjects.length !== 1 ? 's' : '' }}</span>
          </div>
        </div>
      </div>

      <!-- Locked-module upsell banner -->
      <div v-if="locked" class="bg-amber-50 border border-amber-200 rounded-2xl p-5 flex flex-col sm:flex-row sm:items-center justify-between gap-4">
        <div class="flex items-center gap-3">
          <svg class="w-6 h-6 text-amber-600 shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
              d="M16.5 10.5V6.75a4.5 4.5 0 10-9 0v3.75m-.75 11.25h10.5a2.25 2.25 0 002.25-2.25v-6.75a2.25 2.25 0 00-2.25-2.25H6.75a2.25 2.25 0 00-2.25 2.25v6.75a2.25 2.25 0 002.25 2.25z" />
          </svg>
          <div>
            <p class="font-medium text-slate-900">This module is part of a paid plan</p>
            <p class="text-sm text-slate-500 mt-0.5">Upgrade to unlock the full lesson content for {{ module.title }}.</p>
          </div>
        </div>
        <RouterLink to="/pricing"
          class="flex-shrink-0 bg-amber-500 hover:bg-amber-600 text-white text-sm font-medium px-4 py-2 rounded-xl transition-colors text-center">
          View plans
        </RouterLink>
      </div>

      <!-- Subjects list -->
      <div class="space-y-2">
        <RouterLink
          v-for="(s, idx) in module.subjects" :key="s.id"
          :to="locked ? '/pricing' : `/subjects/${s.id}`"
          class="flex items-center gap-4 p-4 bg-white border border-slate-200 rounded-xl
                 hover:border-aviation-300 hover:bg-aviation-50/30 transition-all group">

          <!-- Number badge -->
          <div class="w-8 h-8 rounded-lg bg-aviation-50 border border-aviation-200
                      flex items-center justify-center shrink-0
                      group-hover:border-aviation-300 transition-colors">
            <span class="text-xs font-mono text-aviation-600">{{ String(idx + 1).padStart(2, '0') }}</span>
          </div>

          <div class="flex-1 min-w-0">
            <div class="flex items-center gap-2">
              <span class="text-xs font-mono text-slate-400">{{ s.code }}</span>
            </div>
            <span class="text-sm font-medium text-slate-800 group-hover:text-aviation-700 transition-colors block truncate">
              {{ s.title }}
            </span>
          </div>

          <svg v-if="locked" class="w-4 h-4 text-amber-500 shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
              d="M16.5 10.5V6.75a4.5 4.5 0 10-9 0v3.75m-.75 11.25h10.5a2.25 2.25 0 002.25-2.25v-6.75a2.25 2.25 0 00-2.25-2.25H6.75a2.25 2.25 0 00-2.25 2.25v6.75a2.25 2.25 0 002.25 2.25z" />
          </svg>
          <svg v-else class="w-4 h-4 text-slate-400 group-hover:text-aviation-500 transition-colors shrink-0"
            fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"/>
          </svg>
        </RouterLink>
      </div>

      <!-- AI quick-launch -->
      <div class="bg-aviation-50 border border-aviation-200 rounded-2xl p-5 flex flex-col sm:flex-row sm:items-center justify-between gap-4">
        <div>
          <p class="font-medium text-slate-900">Study this module with AI</p>
          <p class="text-sm text-slate-500 mt-0.5">Get explanations, worked examples, or an oral exam on {{ module.title }}.</p>
        </div>
        <RouterLink :to="{ name: 'ai', query: { subject: module.title } }"
          class="flex-shrink-0 bg-aviation-500 hover:bg-aviation-600 text-white text-sm font-medium px-4 py-2 rounded-xl transition-colors text-center">
          Ask AI
        </RouterLink>
      </div>
    </template>

    <div v-else class="text-center py-12 text-slate-400">Module not found.</div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { RouterLink, useRoute } from 'vue-router'
import { api } from '@/lib/api'
import { useAuthStore } from '@/stores/auth'
import Spinner from '@/components/Spinner.vue'

const route = useRoute()
const authStore = useAuthStore()
const loading = ref(true)
const module = ref<{
  id: number
  code: string
  title: string
  licence_types: string[]
  subjects: { id: number; code: string; title: string }[]
} | null>(null)

// null allowed_module_codes means unrestricted (paid plans); an array means
// only those module codes are unlocked (the free plan).
const locked = computed(() => {
  const allowed = authStore.user?.plan?.allowed_module_codes
  return !!allowed && !!module.value && !allowed.includes(module.value.code)
})

onMounted(async () => {
  const res = await api.get(`/api/v1/content/modules/${route.params.id}`)
  module.value = res.data
  loading.value = false
})
</script>
