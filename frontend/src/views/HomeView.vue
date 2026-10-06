<template>
  <DashboardView v-if="auth.isAuthenticated" />

  <div v-else class="min-h-full">
    <!-- Hero -->
    <div class="relative overflow-hidden bg-white border-b border-slate-200 px-4 sm:px-6 py-16 sm:py-24 text-center">
      <div class="absolute inset-0 bg-gradient-to-b from-aviation-50/70 via-aviation-50/20 to-transparent pointer-events-none" aria-hidden="true" />
      <div class="relative max-w-2xl mx-auto">
        <p class="text-xs font-bold tracking-widest text-aviation-600 uppercase mb-3">EASA Part-66 Training</p>
        <h1 class="text-3xl sm:text-5xl font-bold text-slate-900 tracking-tight leading-tight">
          Build Your Aircraft<br class="hidden sm:block" /> Maintenance Career
        </h1>
        <p class="text-slate-500 mt-4 text-base sm:text-lg max-w-xl mx-auto leading-relaxed">
          Study material, exam preparation, an AI tutor and personal training —
          everything you need for your Part-66 certification, in one place.
        </p>
        <RouterLink to="/auth/register"
          class="inline-block mt-7 bg-aviation-500 hover:bg-aviation-600 text-white text-sm font-semibold px-6 py-3 rounded-xl transition-colors">
          Get Started
        </RouterLink>
      </div>
    </div>

    <!-- Destinations -->
    <div class="p-4 sm:p-6 max-w-5xl mx-auto py-12 sm:py-16">
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
const InfoIcon = icon('M11.25 11.25l.041-.02a.75.75 0 0 1 1.063.852l-.708 2.836a.75.75 0 0 0 1.063.853l.041-.021M21 12a9 9 0 1 1-18 0 9 9 0 0 1 18 0Zm-9-3.75h.008v.008H12V8.25Z')

const tiles = [
  { to: '/modules',  title: 'Study Modules',  description: 'Browse the full EASA Part-66 curriculum — 17 modules, B1 and B2.', icon: BookIcon, gated: false },
  { to: '/ai',       title: 'AI Instructor',  description: 'Ask questions and get answers grounded in your training material.', icon: SparklesIcon, gated: true },
  { to: '/exam',     title: 'Exam Simulator', description: 'Practice real-format EASA-style questions by module.', icon: ClipboardIcon, gated: true },
  { to: '/sessions', title: 'Online Sessions', description: 'Book 1-to-1 training with a certified instructor.', icon: CalendarIcon, gated: true },
  { to: '/about',    title: 'About',          description: 'Meet the founder and the story behind VJet-Academy.', icon: InfoIcon, gated: false },
  { to: '/pricing',  title: 'Pricing',        description: 'Compare the Free, Pro and Exam Pass plans.', icon: TagIcon, gated: false },
]
</script>
