<template>
  <div class="flex h-screen overflow-hidden bg-navy-900">
    <!-- Sidebar -->
    <aside class="hidden lg:flex lg:flex-col w-64 bg-navy-800 border-r border-slate-700/50 flex-shrink-0">
      <div class="flex items-center gap-2 px-6 py-5 border-b border-slate-700/50">
        <svg class="w-6 h-6 text-aviation-400 flex-shrink-0" fill="currentColor" viewBox="0 0 24 24">
          <path d="M21 16v-2l-8-5V3.5a1.5 1.5 0 0 0-3 0V9l-8 5v2l8-2.5V19l-2 1.5V22l3.5-1 3.5 1v-1.5L13 19v-5.5z"/>
        </svg>
        <span class="font-bold text-lg tracking-tight text-white">Aviaverse</span>
      </div>

      <nav class="flex-1 px-3 py-4 space-y-1 overflow-y-auto">
        <RouterLink v-for="item in navItems" :key="item.to" :to="item.to"
          class="flex items-center gap-3 px-3 py-2.5 rounded-xl text-sm font-medium transition-colors"
          :class="[$route.name === item.name
            ? 'bg-aviation-600/20 text-aviation-400 border border-aviation-500/30'
            : 'text-slate-400 hover:bg-slate-700/50 hover:text-white']">
          <component :is="item.icon" class="w-5 h-5 flex-shrink-0" />
          {{ item.label }}
        </RouterLink>
      </nav>

      <div class="px-3 py-4 border-t border-slate-700/50">
        <div class="flex items-center gap-3 px-3 py-2">
          <div class="w-8 h-8 rounded-full bg-aviation-600 flex items-center justify-center text-sm font-bold flex-shrink-0">
            {{ userInitial }}
          </div>
          <div class="flex-1 min-w-0">
            <p class="text-sm font-medium text-white truncate">{{ auth.user?.full_name }}</p>
            <p class="text-xs text-slate-400 truncate">{{ auth.user?.licence_type }}</p>
          </div>
          <button @click="auth.logout(); router.push('/auth/login')" class="text-slate-500 hover:text-slate-300">
            <ArrowRightOnRectangleIcon class="w-4 h-4" />
          </button>
        </div>
      </div>
    </aside>

    <!-- Main -->
    <div class="flex-1 flex flex-col overflow-hidden">
      <!-- Mobile header -->
      <header class="lg:hidden flex items-center justify-between px-4 py-3 bg-navy-800 border-b border-slate-700/50">
        <span class="font-bold text-aviation-400">Aviaverse</span>
        <button @click="mobileOpen = !mobileOpen" class="text-slate-400">
          <Bars3Icon class="w-6 h-6" />
        </button>
      </header>

      <main class="flex-1 overflow-y-auto">
        <RouterView />
      </main>
    </div>

    <!-- Mobile nav drawer -->
    <Transition name="slide">
      <div v-if="mobileOpen" class="fixed inset-0 z-50 lg:hidden">
        <div class="absolute inset-0 bg-black/60" @click="mobileOpen = false" />
        <aside class="absolute left-0 top-0 h-full w-64 bg-navy-800 flex flex-col">
          <div class="flex items-center justify-between px-6 py-5 border-b border-slate-700/50">
            <span class="font-bold text-aviation-400">Aviaverse</span>
            <button @click="mobileOpen = false" class="text-slate-400">
              <XMarkIcon class="w-5 h-5" />
            </button>
          </div>
          <nav class="flex-1 px-3 py-4 space-y-1">
            <RouterLink v-for="item in navItems" :key="item.to" :to="item.to"
              @click="mobileOpen = false"
              class="flex items-center gap-3 px-3 py-2.5 rounded-xl text-sm font-medium transition-colors"
              :class="[$route.name === item.name
                ? 'bg-aviation-600/20 text-aviation-400'
                : 'text-slate-400 hover:bg-slate-700/50 hover:text-white']">
              <component :is="item.icon" class="w-5 h-5" />
              {{ item.label }}
            </RouterLink>
          </nav>
        </aside>
      </div>
    </Transition>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, h } from 'vue'
import { RouterView, RouterLink, useRouter } from 'vue-router'
import { useAuthStore } from '@/stores/auth'

const auth = useAuthStore()
const router = useRouter()
const mobileOpen = ref(false)

const userInitial = computed(() => auth.user?.full_name?.[0]?.toUpperCase() ?? '?')

// Inline icon components using heroicons SVG paths
const icon = (path: string) => ({
  render() {
    return h('svg', { class: 'w-5 h-5', fill: 'none', viewBox: '0 0 24 24', stroke: 'currentColor', 'stroke-width': '1.5' },
      [h('path', { 'stroke-linecap': 'round', 'stroke-linejoin': 'round', d: path })]
    )
  }
})

const HomeIcon = icon('m2.25 12 8.954-8.955c.44-.439 1.152-.439 1.591 0L21.75 12M4.5 9.75v10.125c0 .621.504 1.125 1.125 1.125H9.75v-4.875c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125V21h4.125c.621 0 1.125-.504 1.125-1.125V9.75M8.25 21h8.25')
const BookIcon = icon('M12 6.042A8.967 8.967 0 0 0 6 3.75c-1.052 0-2.062.18-3 .512v14.25A8.987 8.987 0 0 1 6 18c2.305 0 4.408.867 6 2.292m0-14.25a8.966 8.966 0 0 1 6-2.292c1.052 0 2.062.18 3 .512v14.25A8.987 8.987 0 0 0 18 18a8.967 8.967 0 0 0-6 2.292m0-14.25v14.25')
const SparklesIcon = icon('M9.813 15.904 9 18.75l-.813-2.846a4.5 4.5 0 0 0-3.09-3.09L2.25 12l2.846-.813a4.5 4.5 0 0 0 3.09-3.09L9 5.25l.813 2.846a4.5 4.5 0 0 0 3.09 3.09L15.75 12l-2.846.813a4.5 4.5 0 0 0-3.09 3.09ZM18.259 8.715 18 9.75l-.259-1.035a3.375 3.375 0 0 0-2.455-2.456L14.25 6l1.036-.259a3.375 3.375 0 0 0 2.455-2.456L18 2.25l.259 1.035a3.375 3.375 0 0 0 2.456 2.456L21.75 6l-1.035.259a3.375 3.375 0 0 0-2.456 2.456Z')
const ClipboardIcon = icon('M9 12h3.75M9 15h3.75M9 18h3.75m3 .75H18a2.25 2.25 0 0 0 2.25-2.25V6.108c0-1.135-.845-2.098-1.976-2.192a48.424 48.424 0 0 0-1.123-.08m-5.801 0c-.065.21-.1.433-.1.664 0 .414.336.75.75.75h4.5a.75.75 0 0 0 .75-.75 2.25 2.25 0 0 0-.1-.664m-5.8 0A2.251 2.251 0 0 1 13.5 2.25H15c1.012 0 1.867.668 2.15 1.586m-5.8 0c-.376.023-.75.05-1.124.08C9.095 4.01 8.25 4.973 8.25 6.108V8.25m0 0H4.875c-.621 0-1.125.504-1.125 1.125v11.25c0 .621.504 1.125 1.125 1.125h9.75c.621 0 1.125-.504 1.125-1.125V9.375c0-.621-.504-1.125-1.125-1.125H8.25ZM6.75 12h.008v.008H6.75V12Zm0 3h.008v.008H6.75V15Zm0 3h.008v.008H6.75V18Z')
const Bars3Icon = icon('M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5')
const XMarkIcon = icon('M6 18 18 6M6 6l12 12')
const ArrowRightOnRectangleIcon = icon('M8.25 9V5.25A2.25 2.25 0 0 1 10.5 3h6a2.25 2.25 0 0 1 2.25 2.25v13.5A2.25 2.25 0 0 1 16.5 21h-6a2.25 2.25 0 0 1-2.25-2.25V15m-3 0-3-3m0 0 3-3m-3 3H15')

const navItems = [
  { to: '/',        name: 'dashboard',  label: 'Dashboard',     icon: HomeIcon },
  { to: '/modules', name: 'modules',    label: 'Study Modules', icon: BookIcon },
  { to: '/ai',      name: 'ai',         label: 'AI Instructor', icon: SparklesIcon },
  { to: '/exam',    name: 'exam-setup', label: 'Exam Simulator',icon: ClipboardIcon },
]
</script>

<style>
.slide-enter-active, .slide-leave-active { transition: transform 0.25s ease; }
.slide-enter-from, .slide-leave-to { transform: translateX(-100%); }
</style>
