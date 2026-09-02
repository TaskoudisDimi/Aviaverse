<template>
  <div class="min-h-full">
    <!-- Header -->
    <div class="bg-navy-800/60 border-b border-slate-700/30 px-6 py-8">
      <div class="max-w-5xl mx-auto flex flex-col sm:flex-row sm:items-center justify-between gap-4">
        <div>
          <h1 class="text-2xl font-bold text-white">Study Modules</h1>
          <p class="text-slate-400 text-sm mt-1">EASA Part-66 curriculum — 17 modules covering all aviation maintenance topics</p>
        </div>
        <select v-model="licenceFilter"
          class="bg-navy-900 border border-slate-600 rounded-xl px-4 py-2 text-sm text-white
                 focus:outline-none focus:ring-2 focus:ring-aviation-500 self-start sm:self-auto">
          <option value="">All licences</option>
          <option value="B1.1">B1.1</option>
          <option value="B1.3">B1.3</option>
          <option value="B2">B2</option>
        </select>
      </div>
    </div>

    <div class="p-6 max-w-5xl mx-auto">
      <div v-if="loading" class="flex justify-center py-12"><Spinner /></div>

      <div v-else-if="!modules.length" class="text-center py-16 text-slate-500">
        No modules available for this licence type.
      </div>

      <div v-else class="grid sm:grid-cols-2 lg:grid-cols-3 gap-5">
        <RouterLink
          v-for="m in modules" :key="m.id"
          :to="`/modules/${m.id}`"
          class="group relative bg-navy-800 border border-slate-700/50 rounded-2xl overflow-hidden
                 hover:border-aviation-500/40 hover:shadow-lg hover:shadow-aviation-900/30
                 transition-all duration-200 flex flex-col">

          <!-- Coloured top strip -->
          <div class="h-1 w-full" :class="moduleAccent(m.code)" />

          <div class="p-5 flex flex-col flex-1 gap-3">
            <!-- Code badge + licence badges -->
            <div class="flex items-start justify-between gap-2">
              <div class="flex items-center gap-2">
                <!-- Module icon -->
                <div class="w-10 h-10 rounded-xl flex items-center justify-center flex-shrink-0"
                  :class="moduleIconBg(m.code)">
                  <span class="text-lg" v-html="moduleIcon(m.code)" />
                </div>
                <span class="text-xs font-bold px-2 py-0.5 rounded-lg"
                  :class="moduleCodeStyle(m.code)">
                  {{ m.code }}
                </span>
              </div>
              <div class="flex gap-1 flex-wrap justify-end">
                <span v-for="lt in m.licence_types" :key="lt"
                  class="text-xs text-slate-400 border border-slate-600/70 px-1.5 py-0.5 rounded shrink-0">
                  {{ lt }}
                </span>
              </div>
            </div>

            <!-- Title & description -->
            <div class="flex-1">
              <h3 class="font-semibold text-white group-hover:text-aviation-300 transition-colors leading-snug">
                {{ m.title }}
              </h3>
              <p class="text-xs text-slate-400 mt-1.5 line-clamp-3 leading-relaxed">{{ m.description }}</p>
            </div>

            <!-- Footer -->
            <div class="flex items-center justify-between pt-2 border-t border-slate-700/40">
              <span class="text-xs text-slate-500">{{ moduleCategory(m.code) }}</span>
              <svg class="w-4 h-4 text-slate-500 group-hover:text-aviation-400 transition-colors"
                fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"/>
              </svg>
            </div>
          </div>
        </RouterLink>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, watch, onMounted } from 'vue'
import { RouterLink } from 'vue-router'
import { api } from '@/lib/api'
import Spinner from '@/components/Spinner.vue'

interface Module {
  id: number
  code: string
  title: string
  description: string
  licence_types: string[]
  sort_order: number
}

const loading = ref(true)
const modules = ref<Module[]>([])
const licenceFilter = ref('')

async function load() {
  loading.value = true
  const params = licenceFilter.value ? { licence_type: licenceFilter.value } : {}
  const res = await api.get('/api/v1/content/modules', { params })
  modules.value = res.data
  loading.value = false
}

onMounted(load)
watch(licenceFilter, load)

// Module number extracted from code like "M02" → 2
function moduleNum(code: string): number {
  return parseInt(code.replace('M', ''), 10) || 0
}

// Category name for footer label
function moduleCategory(code: string): string {
  const n = moduleNum(code)
  if (n <= 3)  return 'Science & Theory'
  if (n <= 5)  return 'Electronics & Digital'
  if (n <= 7)  return 'Materials & Practices'
  if (n === 8) return 'Aerodynamics'
  if (n === 9) return 'Human Factors'
  if (n === 10) return 'Aviation Legislation'
  return 'Aircraft Systems'
}

// Top strip accent colour
function moduleAccent(code: string): string {
  const n = moduleNum(code)
  if (n <= 3)  return 'bg-gradient-to-r from-blue-500 to-indigo-500'
  if (n <= 5)  return 'bg-gradient-to-r from-violet-500 to-purple-500'
  if (n <= 7)  return 'bg-gradient-to-r from-amber-500 to-orange-500'
  if (n === 8) return 'bg-gradient-to-r from-sky-500 to-cyan-500'
  if (n === 9) return 'bg-gradient-to-r from-emerald-500 to-green-500'
  if (n === 10) return 'bg-gradient-to-r from-yellow-500 to-amber-500'
  return 'bg-gradient-to-r from-rose-500 to-red-500'
}

// Icon background
function moduleIconBg(code: string): string {
  const n = moduleNum(code)
  if (n <= 3)  return 'bg-blue-900/40'
  if (n <= 5)  return 'bg-violet-900/40'
  if (n <= 7)  return 'bg-amber-900/40'
  if (n === 8) return 'bg-sky-900/40'
  if (n === 9) return 'bg-emerald-900/40'
  if (n === 10) return 'bg-yellow-900/40'
  return 'bg-rose-900/40'
}

// Code badge style
function moduleCodeStyle(code: string): string {
  const n = moduleNum(code)
  if (n <= 3)  return 'text-blue-300 bg-blue-900/30'
  if (n <= 5)  return 'text-violet-300 bg-violet-900/30'
  if (n <= 7)  return 'text-amber-300 bg-amber-900/30'
  if (n === 8) return 'text-sky-300 bg-sky-900/30'
  if (n === 9) return 'text-emerald-300 bg-emerald-900/30'
  if (n === 10) return 'text-yellow-300 bg-yellow-900/30'
  return 'text-rose-300 bg-rose-900/30'
}

// Module icon (SVG string or unicode)
function moduleIcon(code: string): string {
  const n = moduleNum(code)
  const icons: Record<number, string> = {
    1:  '<svg viewBox="0 0 24 24" class="w-5 h-5 text-blue-400" fill="currentColor"><text y="18" font-size="16" font-family="serif">∑</text></svg>',
    2:  `<svg viewBox="0 0 24 24" class="w-5 h-5 text-blue-400" fill="none" stroke="currentColor" stroke-width="1.5"><circle cx="12" cy="12" r="3"/><ellipse cx="12" cy="12" rx="10" ry="4"/><ellipse cx="12" cy="12" rx="10" ry="4" transform="rotate(60 12 12)"/><ellipse cx="12" cy="12" rx="10" ry="4" transform="rotate(120 12 12)"/></svg>`,
    3:  `<svg viewBox="0 0 24 24" class="w-5 h-5 text-blue-400" fill="none" stroke="currentColor" stroke-width="1.5"><path stroke-linecap="round" stroke-linejoin="round" d="M13 10V3L4 14h7v7l9-11h-7z"/></svg>`,
    4:  `<svg viewBox="0 0 24 24" class="w-5 h-5 text-violet-400" fill="none" stroke="currentColor" stroke-width="1.5"><path stroke-linecap="round" stroke-linejoin="round" d="M9 3H5a2 2 0 00-2 2v4m6-6h10a2 2 0 012 2v4M9 3v18m0 0h10a2 2 0 002-2V9M9 21H5a2 2 0 01-2-2V9m0 0h18"/></svg>`,
    5:  `<svg viewBox="0 0 24 24" class="w-5 h-5 text-violet-400" fill="none" stroke="currentColor" stroke-width="1.5"><path stroke-linecap="round" stroke-linejoin="round" d="M10 20l4-16m4 4l4 4-4 4M6 16l-4-4 4-4"/></svg>`,
    6:  `<svg viewBox="0 0 24 24" class="w-5 h-5 text-amber-400" fill="none" stroke="currentColor" stroke-width="1.5"><path stroke-linecap="round" stroke-linejoin="round" d="M19.428 15.428a2 2 0 00-1.022-.547l-2.387-.477a6 6 0 00-3.86.517l-.318.158a6 6 0 01-3.86.517L6.05 15.21a2 2 0 00-1.806.547M8 4h8l-1 1v5.172a2 2 0 00.586 1.414l5 5c1.26 1.26.367 3.414-1.415 3.414H4.828c-1.782 0-2.674-2.154-1.414-3.414l5-5A2 2 0 009 10.172V5L8 4z"/></svg>`,
    7:  `<svg viewBox="0 0 24 24" class="w-5 h-5 text-amber-400" fill="none" stroke="currentColor" stroke-width="1.5"><path stroke-linecap="round" stroke-linejoin="round" d="M11 4a2 2 0 114 0v1a1 1 0 001 1h3a1 1 0 011 1v3a1 1 0 01-1 1h-1a2 2 0 100 4h1a1 1 0 011 1v3a1 1 0 01-1 1h-3a1 1 0 01-1-1v-1a2 2 0 10-4 0v1a1 1 0 01-1 1H7a1 1 0 01-1-1v-3a1 1 0 00-1-1H4a2 2 0 110-4h1a1 1 0 001-1V7a1 1 0 011-1h3a1 1 0 001-1V4z"/></svg>`,
    8:  `<svg viewBox="0 0 24 24" class="w-5 h-5 text-sky-400" fill="currentColor"><path d="M21 16v-2l-8-5V3.5a1.5 1.5 0 00-3 0V9l-8 5v2l8-2.5V19l-2 1.5V22l3.5-1 3.5 1v-1.5L13 19v-5.5l8 2.5z"/></svg>`,
    9:  `<svg viewBox="0 0 24 24" class="w-5 h-5 text-emerald-400" fill="none" stroke="currentColor" stroke-width="1.5"><path stroke-linecap="round" stroke-linejoin="round" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0z"/></svg>`,
    10: `<svg viewBox="0 0 24 24" class="w-5 h-5 text-yellow-400" fill="none" stroke="currentColor" stroke-width="1.5"><path stroke-linecap="round" stroke-linejoin="round" d="M3 6l3 1m0 0l-3 9a5.002 5.002 0 006.001 0M6 7l3 9M6 7l6-2m6 2l3-1m-3 1l-3 9a5.002 5.002 0 006.001 0M18 7l3 9m-3-9l-6-2m0-2v2m0 16V5m0 16H9m3 0h3"/></svg>`,
  }
  return icons[n] ?? `<svg viewBox="0 0 24 24" class="w-5 h-5 text-rose-400" fill="none" stroke="currentColor" stroke-width="1.5"><path stroke-linecap="round" stroke-linejoin="round" d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z"/><path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/></svg>`
}
</script>
