<template>
  <DashboardView v-if="auth.isAuthenticated" />

  <div v-else class="min-h-full">
    <!-- Hero -->
    <div class="bg-white border-b border-slate-200 px-4 sm:px-6 py-14 sm:py-20 text-center">
      <div class="max-w-2xl mx-auto">
        <div class="w-14 h-14 rounded-2xl bg-aviation-500 flex items-center justify-center mx-auto mb-5">
          <svg class="w-7 h-7 text-white" fill="currentColor" viewBox="0 0 24 24">
            <path d="M21 16v-2l-8-5V3.5a1.5 1.5 0 0 0-3 0V9l-8 5v2l8-2.5V19l-2 1.5V22l3.5-1 3.5 1v-1.5L13 19v-5.5z"/>
          </svg>
        </div>
        <h1 class="text-3xl sm:text-4xl font-bold text-slate-900 tracking-tight">VJet-Academy</h1>
        <p class="text-slate-500 mt-3 text-base sm:text-lg">
          EASA Part-66 study material, exam preparation and an AI tutor — everything you need for your aircraft maintenance career.
        </p>
        <div class="flex items-center justify-center gap-3 mt-7 flex-wrap">
          <RouterLink to="/modules"
            class="bg-aviation-500 hover:bg-aviation-600 text-white text-sm font-medium px-5 py-2.5 rounded-xl transition-colors">
            Browse Study Modules
          </RouterLink>
          <RouterLink to="/pricing"
            class="bg-white border border-slate-300 hover:bg-slate-50 text-slate-700 text-sm font-medium px-5 py-2.5 rounded-xl transition-colors">
            View Pricing
          </RouterLink>
        </div>
      </div>
    </div>

    <!-- Nav tiles -->
    <div class="p-4 sm:p-6 max-w-5xl mx-auto">
      <div class="grid sm:grid-cols-2 lg:grid-cols-3 gap-5">
        <RouterLink v-for="t in tiles" :key="t.to" :to="t.to"
          class="group bg-white border border-slate-200 rounded-2xl p-5 flex flex-col gap-3
                 hover:border-aviation-300 hover:shadow-lg hover:shadow-aviation-100 transition-all">
          <div class="w-10 h-10 rounded-xl bg-aviation-50 flex items-center justify-center">
            <component :is="t.icon" class="w-5 h-5 text-aviation-600" />
          </div>
          <div>
            <h3 class="font-semibold text-slate-900 group-hover:text-aviation-600 transition-colors">{{ t.title }}</h3>
            <p class="text-xs text-slate-500 mt-1 leading-relaxed">{{ t.description }}</p>
          </div>
          <span class="text-xs font-medium text-aviation-600 flex items-center gap-1 mt-auto">
            {{ t.gated ? 'Sign in to continue' : 'Explore' }}
            <svg class="w-3.5 h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"/>
            </svg>
          </span>
        </RouterLink>
      </div>
    </div>

    <AppFooter />
  </div>
</template>

<script setup lang="ts">
import { h } from 'vue'
import { RouterLink } from 'vue-router'
import { useAuthStore } from '@/stores/auth'
import DashboardView from './DashboardView.vue'
import AppFooter from '@/components/AppFooter.vue'

const auth = useAuthStore()

const icon = (path: string) => ({
  render() {
    return h('svg', { fill: 'none', viewBox: '0 0 24 24', stroke: 'currentColor', 'stroke-width': '1.5' },
      [h('path', { 'stroke-linecap': 'round', 'stroke-linejoin': 'round', d: path })]
    )
  }
})

const BookIcon = icon('M12 6.042A8.967 8.967 0 0 0 6 3.75c-1.052 0-2.062.18-3 .512v14.25A8.987 8.987 0 0 1 6 18c2.305 0 4.408.867 6 2.292m0-14.25a8.966 8.966 0 0 1 6-2.292c1.052 0 2.062.18 3 .512v14.25A8.987 8.987 0 0 0 18 18a8.967 8.967 0 0 0-6 2.292m0-14.25v14.25')
const TagIcon = icon('M9.568 3H5.25A2.25 2.25 0 0 0 3 5.25v4.318c0 .597.237 1.17.659 1.591l9.581 9.581c.699.699 1.78.872 2.607.33a18.095 18.095 0 0 0 5.223-5.223c.542-.827.369-1.908-.33-2.607L11.16 3.66A2.25 2.25 0 0 0 9.568 3Z M6 6h.008v.008H6V6Z')
const SparklesIcon = icon('M9.813 15.904 9 18.75l-.813-2.846a4.5 4.5 0 0 0-3.09-3.09L2.25 12l2.846-.813a4.5 4.5 0 0 0 3.09-3.09L9 5.25l.813 2.846a4.5 4.5 0 0 0 3.09 3.09L15.75 12l-2.846.813a4.5 4.5 0 0 0-3.09 3.09Z')
const ClipboardIcon = icon('M9 12h3.75M9 15h3.75M9 18h3.75m3 .75H18a2.25 2.25 0 0 0 2.25-2.25V6.108c0-1.135-.845-2.098-1.976-2.192a48.424 48.424 0 0 0-1.123-.08m-5.801 0c-.065.21-.1.433-.1.664 0 .414.336.75.75.75h4.5a.75.75 0 0 0 .75-.75 2.25 2.25 0 0 0-.1-.664m-5.8 0A2.251 2.251 0 0 1 13.5 2.25H15c1.012 0 1.867.668 2.15 1.586m-5.8 0c-.376.023-.75.05-1.124.08C9.095 4.01 8.25 4.973 8.25 6.108V8.25m0 0H4.875c-.621 0-1.125.504-1.125 1.125v11.25c0 .621.504 1.125 1.125 1.125h9.75c.621 0 1.125-.504 1.125-1.125V9.375c0-.621-.504-1.125-1.125-1.125H8.25ZM6.75 12h.008v.008H6.75V12Zm0 3h.008v.008H6.75V15Zm0 3h.008v.008H6.75V18Z')
const CalendarIcon = icon('M6.75 3v2.25M17.25 3v2.25M3 18.75V7.5a2.25 2.25 0 0 1 2.25-2.25h13.5A2.25 2.25 0 0 1 21 7.5v11.25m-18 0A2.25 2.25 0 0 0 5.25 21h13.5A2.25 2.25 0 0 0 21 18.75m-18 0v-7.5A2.25 2.25 0 0 1 5.25 9h13.5A2.25 2.25 0 0 1 21 11.25v7.5')

const tiles = [
  { to: '/modules',  title: 'Study Modules',  description: 'Browse the full EASA Part-66 curriculum — 17 modules, B1 and B2.', icon: BookIcon, gated: false },
  { to: '/pricing',  title: 'Pricing',        description: 'Compare the Free, Pro and Exam Pass plans.', icon: TagIcon, gated: false },
  { to: '/ai',       title: 'AI Instructor',  description: 'Ask questions and get answers grounded in your training material.', icon: SparklesIcon, gated: true },
  { to: '/exam',     title: 'Exam Simulator', description: 'Practice real-format EASA-style questions by module.', icon: ClipboardIcon, gated: true },
  { to: '/sessions', title: 'Online Sessions', description: 'Book 1-to-1 training with a certified instructor.', icon: CalendarIcon, gated: true },
]
</script>
