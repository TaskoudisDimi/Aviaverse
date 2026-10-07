<template>
  <div class="flex flex-col h-screen overflow-hidden bg-slate-50">
    <!-- Top navbar -->
    <header class="flex-shrink-0 bg-white border-b border-slate-200">
      <div class="flex items-center h-16 px-4 sm:px-6 gap-4">
        <RouterLink to="/" class="flex items-center gap-2 flex-shrink-0">
          <img src="/favicon.png" alt="" class="w-7 h-7 flex-shrink-0" />
          <span class="font-bold text-lg tracking-tight text-slate-900 whitespace-nowrap">VJet-Academy</span>
        </RouterLink>

        <!-- Desktop nav -->
        <nav class="hidden lg:flex items-center gap-0.5 flex-1 min-w-0 overflow-x-auto [scrollbar-width:none] [&::-webkit-scrollbar]:hidden">
          <RouterLink v-for="item in visibleNavItems" :key="item.to" :to="item.to"
            class="flex items-center gap-1.5 px-2.5 py-2 rounded-xl text-sm font-medium transition-colors whitespace-nowrap shrink-0"
            :class="[$route.name === item.name
              ? 'bg-aviation-50 text-aviation-700 border border-aviation-200'
              : 'text-slate-500 hover:bg-slate-100 hover:text-slate-900']">
            <component :is="item.icon" class="w-5 h-5 flex-shrink-0" />
            {{ item.label }}
          </RouterLink>
        </nav>

        <div class="flex-1 lg:flex-none" />

        <!-- Guest actions (desktop) -->
        <div v-if="!auth.isAuthenticated" class="hidden lg:flex items-center gap-2 flex-shrink-0">
          <RouterLink to="/auth/login"
            class="px-3.5 py-2 rounded-xl text-sm font-medium text-slate-600 hover:bg-slate-100 transition-colors">
            Log in
          </RouterLink>
          <RouterLink to="/auth/register"
            class="px-3.5 py-2 rounded-xl text-sm font-medium bg-aviation-500 hover:bg-aviation-600 text-white transition-colors">
            Get Started
          </RouterLink>
        </div>

        <!-- User menu (desktop) -->
        <div v-else class="hidden lg:block relative flex-shrink-0">
          <button @click="userMenuOpen = !userMenuOpen"
            class="flex items-center gap-2 py-1.5 pl-2 pr-1.5 rounded-xl hover:bg-slate-100 transition-colors">
            <div class="text-right">
              <p class="text-sm font-medium text-slate-900 leading-tight">{{ auth.user?.full_name }}</p>
              <p class="text-xs text-slate-500 leading-tight">{{ auth.user?.plan?.name ?? auth.user?.licence_type }}</p>
            </div>
            <div class="w-8 h-8 rounded-full bg-aviation-500 flex items-center justify-center text-sm font-bold text-white flex-shrink-0">
              {{ userInitial }}
            </div>
            <ChevronDownIcon class="w-4 h-4 text-slate-400 transition-transform" :class="{ 'rotate-180': userMenuOpen }" />
          </button>

          <div v-if="userMenuOpen" class="fixed inset-0 z-40" @click="userMenuOpen = false" />
          <Transition name="fade">
            <div v-if="userMenuOpen"
              class="absolute right-0 top-full mt-2 w-52 bg-white rounded-xl border border-slate-200 shadow-lg py-1.5 z-50">
              <RouterLink to="/settings" @click="userMenuOpen = false"
                class="flex items-center gap-2.5 px-3.5 py-2.5 text-sm text-slate-700 hover:bg-slate-50">
                <CogIcon class="w-4 h-4 text-slate-400 flex-shrink-0" />
                Settings &amp; Plan
              </RouterLink>
              <RouterLink v-if="auth.user?.is_admin" to="/admin" @click="userMenuOpen = false"
                class="flex items-center gap-2.5 px-3.5 py-2.5 text-sm text-slate-700 hover:bg-slate-50">
                <ShieldIcon class="w-4 h-4 text-slate-400 flex-shrink-0" />
                Admin
              </RouterLink>
              <button @click="auth.logout(); router.push('/')"
                class="w-full flex items-center gap-2.5 px-3.5 py-2.5 text-sm text-slate-700 hover:bg-slate-50">
                <ArrowRightOnRectangleIcon class="w-4 h-4 text-slate-400 flex-shrink-0" />
                Log out
              </button>
            </div>
          </Transition>
        </div>

        <!-- Mobile toggle -->
        <button @click="mobileOpen = !mobileOpen" class="lg:hidden text-slate-500 flex-shrink-0">
          <Bars3Icon class="w-6 h-6" />
        </button>
      </div>
    </header>

    <main class="relative flex-1 overflow-y-auto">
      <svg class="fixed inset-0 w-full h-full pointer-events-none z-0" preserveAspectRatio="xMidYMid slice" viewBox="0 0 1600 1000" aria-hidden="true">
        <g stroke="#94a3b8" stroke-width="1" fill="none" opacity="0.4">
          <!-- turbofan cutaway, left edge -->
          <line x1="-40" y1="500" x2="420" y2="500" stroke-dasharray="2 6"/>
          <circle cx="60" cy="500" r="120"/>
          <circle cx="60" cy="500" r="80"/>
          <circle cx="170" cy="500" r="95"/>
          <circle cx="170" cy="500" r="55"/>
          <circle cx="280" cy="500" r="70"/>
          <circle cx="370" cy="500" r="45"/>
          <path d="M-40 430 L420 455 M-40 570 L420 545"/>
        </g>
        <g fill="#94a3b8" opacity="0.55" font-family="IBM Plex Mono, ui-monospace, monospace" font-size="11" letter-spacing="2">
          <text x="20" y="335">FAN</text>
          <text x="20" y="378">COMPRESSOR</text>
          <text x="20" y="421">COMBUSTION</text>
          <text x="20" y="642">TURBINE</text>
          <text x="20" y="685">EXHAUST</text>
        </g>
        <g stroke="#94a3b8" stroke-width="1" fill="none" opacity="0.4">
          <!-- aircraft silhouette, right edge -->
          <path d="M1560 360 L1560 560 L1500 600 L1470 600 L1470 585 L1495 575 L1495 460 L1420 510 L1420 545 L1440 555 L1440 566 L1400 566 L1400 400 L1420 400 L1420 435 L1495 385 L1495 300 L1440 265 L1440 253 L1400 253 L1400 240 L1470 240 L1470 255 L1500 275 Z"/>
          <line x1="1560" y1="230" x2="1560" y2="780" stroke-dasharray="2 6"/>
        </g>
        <g fill="#94a3b8" opacity="0.55" font-family="IBM Plex Mono, ui-monospace, monospace" font-size="11" letter-spacing="2">
          <text x="1580" y="470" transform="rotate(90 1580 470)">MAINTAIN</text>
          <text x="1580" y="600" transform="rotate(90 1580 600)">LEARN</text>
          <text x="1580" y="700" transform="rotate(90 1580 700)">CERTIFY</text>
          <text x="1580" y="800" transform="rotate(90 1580 800)">FLY HIGHER</text>
        </g>
      </svg>
      <!-- Chat/exam screens manage their own internal scroll region and need
           to exactly fill the available height — a footer below them would
           break that fixed header/scroll-area/input layout, so they skip it. -->
      <div v-if="$route.meta.fullHeight" class="relative z-10 h-full">
        <RouterView />
      </div>
      <div v-else class="relative z-10 min-h-full flex flex-col">
        <div class="flex-1">
          <RouterView />
        </div>
        <AppFooter />
      </div>
    </main>

    <!-- Mobile nav drawer -->
    <Transition name="slide">
      <div v-if="mobileOpen" class="fixed inset-0 z-50 lg:hidden">
        <div class="absolute inset-0 bg-black/40" @click="mobileOpen = false" />
        <aside class="absolute left-0 top-0 h-full w-64 bg-white flex flex-col">
          <div class="flex items-center justify-between px-6 py-5 border-b border-slate-200">
            <RouterLink to="/" @click="mobileOpen = false" class="flex items-center gap-2">
              <img src="/favicon.png" alt="" class="w-6 h-6 flex-shrink-0" />
              <span class="font-bold text-aviation-600">VJet-Academy</span>
            </RouterLink>
            <button @click="mobileOpen = false" class="text-slate-500">
              <XMarkIcon class="w-5 h-5" />
            </button>
          </div>
          <nav class="flex-1 px-3 py-4 space-y-1">
            <RouterLink v-for="item in visibleNavItems" :key="item.to" :to="item.to"
              @click="mobileOpen = false"
              class="flex items-center gap-3 px-3 py-2.5 rounded-xl text-sm font-medium transition-colors"
              :class="[$route.name === item.name
                ? 'bg-aviation-50 text-aviation-700'
                : 'text-slate-500 hover:bg-slate-100 hover:text-slate-900']">
              <component :is="item.icon" class="w-5 h-5" />
              {{ item.label }}
            </RouterLink>
            <template v-if="auth.isAuthenticated">
              <hr class="my-2 border-slate-200" />
              <RouterLink to="/settings" @click="mobileOpen = false"
                class="flex items-center gap-3 px-3 py-2.5 rounded-xl text-sm font-medium transition-colors"
                :class="[$route.name === 'settings'
                  ? 'bg-aviation-50 text-aviation-700'
                  : 'text-slate-500 hover:bg-slate-100 hover:text-slate-900']">
                <CogIcon class="w-5 h-5" />
                Settings &amp; Plan
              </RouterLink>
              <RouterLink v-if="auth.user?.is_admin" to="/admin" @click="mobileOpen = false"
                class="flex items-center gap-3 px-3 py-2.5 rounded-xl text-sm font-medium transition-colors"
                :class="[$route.name === 'admin'
                  ? 'bg-aviation-50 text-aviation-700'
                  : 'text-slate-500 hover:bg-slate-100 hover:text-slate-900']">
                <ShieldIcon class="w-5 h-5" />
                Admin
              </RouterLink>
            </template>
          </nav>
          <div class="px-3 py-4 border-t border-slate-200">
            <div v-if="auth.isAuthenticated" class="flex items-center gap-3 px-3 py-2">
              <RouterLink to="/settings" @click="mobileOpen = false" class="flex items-center gap-3 flex-1 min-w-0">
                <div class="w-8 h-8 rounded-full bg-aviation-500 flex items-center justify-center text-sm font-bold text-white flex-shrink-0">
                  {{ userInitial }}
                </div>
                <div class="flex-1 min-w-0">
                  <p class="text-sm font-medium text-slate-900 truncate">{{ auth.user?.full_name }}</p>
                  <p class="text-xs text-slate-500 truncate">{{ auth.user?.plan?.name ?? auth.user?.licence_type }}</p>
                </div>
              </RouterLink>
              <button @click="auth.logout(); router.push('/')" class="text-slate-400 hover:text-slate-600">
                <ArrowRightOnRectangleIcon class="w-4 h-4" />
              </button>
            </div>
            <div v-else class="flex items-center gap-2 px-1">
              <RouterLink to="/auth/login" @click="mobileOpen = false"
                class="flex-1 text-center px-3.5 py-2.5 rounded-xl text-sm font-medium text-slate-600 hover:bg-slate-100 transition-colors">
                Log in
              </RouterLink>
              <RouterLink to="/auth/register" @click="mobileOpen = false"
                class="flex-1 text-center px-3.5 py-2.5 rounded-xl text-sm font-medium bg-aviation-500 hover:bg-aviation-600 text-white transition-colors">
                Get Started
              </RouterLink>
            </div>
          </div>
        </aside>
      </div>
    </Transition>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, h } from 'vue'
import { RouterView, RouterLink, useRouter } from 'vue-router'
import { useAuthStore } from '@/stores/auth'
import AppFooter from '@/components/AppFooter.vue'

const auth = useAuthStore()
const router = useRouter()
const mobileOpen = ref(false)
const userMenuOpen = ref(false)

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
const CalendarIcon = icon('M6.75 3v2.25M17.25 3v2.25M3 18.75V7.5a2.25 2.25 0 0 1 2.25-2.25h13.5A2.25 2.25 0 0 1 21 7.5v11.25m-18 0A2.25 2.25 0 0 0 5.25 21h13.5A2.25 2.25 0 0 0 21 18.75m-18 0v-7.5A2.25 2.25 0 0 1 5.25 9h13.5A2.25 2.25 0 0 1 21 11.25v7.5')
const Bars3Icon = icon('M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5')
const XMarkIcon = icon('M6 18 18 6M6 6l12 12')
const ArrowRightOnRectangleIcon = icon('M8.25 9V5.25A2.25 2.25 0 0 1 10.5 3h6a2.25 2.25 0 0 1 2.25 2.25v13.5A2.25 2.25 0 0 1 16.5 21h-6a2.25 2.25 0 0 1-2.25-2.25V15m-3 0-3-3m0 0 3-3m-3 3H15')
const ChevronDownIcon = icon('m19.5 8.25-7.5 7.5-7.5-7.5')
const CogIcon = icon('M10.343 3.94c.09-.542.56-.94 1.11-.94h1.093c.55 0 1.02.398 1.11.94l.149.894c.07.424.384.764.78.93.398.164.855.142 1.205-.108l.737-.527a1.125 1.125 0 0 1 1.45.12l.773.774c.39.389.44 1.002.12 1.45l-.527.737c-.25.35-.272.806-.107 1.204.165.397.505.71.93.78l.893.15c.543.09.94.56.94 1.109v1.094c0 .55-.397 1.02-.94 1.11l-.893.149c-.425.07-.765.383-.93.78-.165.398-.143.854.107 1.204l.527.738c.32.447.269 1.06-.12 1.45l-.774.773a1.125 1.125 0 0 1-1.449.12l-.738-.527c-.35-.25-.806-.272-1.203-.107-.397.165-.71.505-.781.929l-.149.894c-.09.542-.56.94-1.11.94h-1.094c-.55 0-1.019-.398-1.11-.94l-.148-.894c-.071-.424-.384-.764-.781-.93-.398-.164-.854-.142-1.204.108l-.738.527c-.447.32-1.06.269-1.45-.12l-.773-.774a1.125 1.125 0 0 1-.12-1.45l.527-.737c.25-.35.272-.806.108-1.204-.165-.397-.506-.71-.93-.78l-.894-.15c-.542-.09-.94-.56-.94-1.109v-1.094c0-.55.398-1.02.94-1.11l.894-.149c.424-.07.765-.383.93-.78.164-.398.142-.854-.108-1.204l-.527-.738a1.125 1.125 0 0 1 .12-1.45l.773-.773a1.125 1.125 0 0 1 1.45-.12l.737.527c.35.25.807.272 1.204.107.397-.165.71-.505.78-.929l.15-.894ZM15 12a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z')
const ShieldIcon = icon('M9 12.75 11.25 15 15 9.75m-3-7.036A11.959 11.959 0 0 1 3.598 6 11.99 11.99 0 0 0 3 9.749c0 5.592 3.824 10.29 9 11.623 5.176-1.332 9-6.03 9-11.622 0-1.31-.21-2.571-.598-3.751h-.152c-3.196 0-6.1-1.248-8.25-3.285Z')
const TagIcon = icon('M9.568 3H5.25A2.25 2.25 0 0 0 3 5.25v4.318c0 .597.237 1.17.659 1.591l9.581 9.581c.699.699 1.78.872 2.607.33a18.095 18.095 0 0 0 5.223-5.223c.542-.827.369-1.908-.33-2.607L11.16 3.66A2.25 2.25 0 0 0 9.568 3Z M6 6h.008v.008H6V6Z')
const InfoIcon = icon('M11.25 11.25l.041-.02a.75.75 0 0 1 1.063.852l-.708 2.836a.75.75 0 0 0 1.063.853l.041-.021M21 12a9 9 0 1 1-18 0 9 9 0 0 1 18 0Zm-9-3.75h.008v.008H12V8.25Z')
const LibraryIcon = icon('M12 21v-8.25M15.75 21v-8.25M8.25 21v-8.25M3 9l9-6 9 6m-1.5 12V10.332A48.36 48.36 0 0 0 12 9.75c-2.551 0-5.056.2-7.5.582V21M3 21h18M12 6.75h.008v.008H12V6.75Z')

const navItems = [
  { to: '/',         name: 'dashboard',  label: 'Dashboard',        icon: HomeIcon },
  { to: '/modules',  name: 'modules',    label: 'Study Modules',    icon: BookIcon },
  { to: '/ai',       name: 'ai',         label: 'AI Instructor',    icon: SparklesIcon },
  { to: '/exam',     name: 'exam-setup', label: 'Exam Simulator',   icon: ClipboardIcon },
  { to: '/sessions', name: 'sessions',   label: 'Online Sessions',  icon: CalendarIcon },
  { to: '/about',    name: 'about',      label: 'About',            icon: InfoIcon },
  { to: '/literature', name: 'literature', label: 'Literature',     icon: LibraryIcon },
  { to: '/pricing',  name: 'pricing',    label: 'Pricing',          icon: TagIcon },
]

// Guests see every tab except Dashboard (which just re-shows this same
// landing page when logged out) — clicking a gated one sends them to login.
const visibleNavItems = computed(() =>
  auth.isAuthenticated ? navItems : navItems.filter(item => item.name !== 'dashboard')
)
</script>

<style>
.slide-enter-active, .slide-leave-active { transition: transform 0.25s ease; }
.slide-enter-from, .slide-leave-to { transform: translateX(-100%); }
.fade-enter-active, .fade-leave-active { transition: opacity 0.12s ease, transform 0.12s ease; }
.fade-enter-from, .fade-leave-to { opacity: 0; transform: translateY(-4px); }
</style>
