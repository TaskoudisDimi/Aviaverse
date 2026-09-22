<template>
  <div class="p-4 sm:p-6 max-w-5xl mx-auto space-y-8">
    <!-- Header -->
    <div>
      <h1 class="text-2xl font-bold text-slate-900">Online Sessions & CV/LinkedIn Review</h1>
      <p class="text-slate-500 text-sm mt-1">Book a one-on-one session or get your CV and LinkedIn profile reviewed by an EASA expert</p>
    </div>

    <!-- Services grid -->
    <div class="grid sm:grid-cols-2 gap-5">
      <div
        v-for="svc in services" :key="svc.title"
        class="bg-white border border-slate-200 rounded-2xl p-6 hover:border-aviation-300 transition-colors cursor-pointer"
        :class="selected === svc.calSlug ? 'border-aviation-400 bg-aviation-50/40' : ''"
        @click="selectService(svc.calSlug)"
      >
        <div class="w-10 h-10 rounded-xl bg-aviation-50 flex items-center justify-center mb-4">
          <svg class="w-5 h-5 text-aviation-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" :d="svc.icon"/>
          </svg>
        </div>
        <h2 class="text-base font-semibold text-slate-900 mb-1">{{ svc.title }}</h2>
        <p class="text-sm text-slate-500">{{ svc.description }}</p>
        <ul class="mt-3 space-y-1">
          <li v-for="bullet in svc.bullets" :key="bullet"
              class="flex items-center gap-1.5 text-xs text-slate-400">
            <span class="w-1 h-1 rounded-full bg-aviation-500 inline-block flex-shrink-0"></span>
            {{ bullet }}
          </li>
        </ul>
        <div v-if="selected === svc.calSlug" class="mt-3 flex items-center gap-1.5 text-xs font-medium text-aviation-600">
          <svg class="w-3.5 h-3.5" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M16.704 4.153a.75.75 0 0 1 .143 1.052l-8 10.5a.75.75 0 0 1-1.127.075l-4.5-4.5a.75.75 0 0 1 1.06-1.06l3.894 3.893 7.48-9.817a.75.75 0 0 1 1.05-.143Z" clip-rule="evenodd"/>
          </svg>
          Selected
        </div>
      </div>
    </div>

    <!-- Booking embed -->
    <div class="bg-white border border-slate-200 rounded-2xl overflow-hidden">
      <div class="flex flex-col sm:flex-row sm:items-center justify-between gap-2 px-4 sm:px-6 py-4 border-b border-slate-200">
        <div>
          <h2 class="text-base font-semibold text-slate-900">Book Your Session</h2>
          <p class="text-xs text-slate-500 mt-0.5">Pick a date and time — sessions via Google Meet or Zoom</p>
        </div>
        <span class="text-xs text-aviation-700 font-medium bg-aviation-50 border border-aviation-200 px-2.5 py-1 rounded-full self-start sm:self-auto">
          Powered by Cal.com
        </span>
      </div>

      <!-- Cal inline embed -->
      <div ref="calContainer" class="w-full min-h-[620px] bg-slate-50" />
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted, watch } from 'vue'

// Cal.com username, set via VITE_CAL_USERNAME in frontend/.env (see .env.example).
// Sign up at https://cal.com and create event types matching the slugs used
// in `services[].calSlug` below.
const CAL_USERNAME = import.meta.env.VITE_CAL_USERNAME || 'aviaverse'

const calContainer = ref<HTMLElement | null>(null)
const selected = ref('consultation')

const services = [
  {
    calSlug: 'consultation',
    title: '1-on-1 Study Session',
    description: 'Deep-dive into any EASA Part-66 module with a certified instructor via video call.',
    icon: 'M15 10.5a3 3 0 1 1-6 0 3 3 0 0 1 6 0ZM19.5 10.5c0 7.142-7.5 11.25-7.5 11.25S4.5 17.642 4.5 10.5a7.5 7.5 0 1 1 15 0Z',
    bullets: ['60-min or 90-min sessions available', 'All modules covered', 'Practice oral exam questions'],
  },
  {
    calSlug: 'cv-review',
    title: 'CV Review',
    description: 'Get your aviation CV reviewed and optimised to stand out to MROs, airlines, and Part-145 organisations.',
    icon: 'M19.5 14.25v-2.625a3.375 3.375 0 0 0-3.375-3.375h-1.5A1.125 1.125 0 0 1 13.5 7.125v-1.5a3.375 3.375 0 0 0-3.375-3.375H8.25m0 12.75h7.5m-7.5 3H12M10.5 2.25H5.625c-.621 0-1.125.504-1.125 1.125v17.25c0 .621.504 1.125 1.125 1.125h12.75c.621 0 1.125-.504 1.125-1.125V11.25a9 9 0 0 0-9-9Z',
    bullets: ['Tailored for EASA Part-66 candidates', 'Keyword optimisation for MRO applicants', 'Written feedback within 48 hours'],
  },
  {
    calSlug: 'linkedin-review',
    title: 'LinkedIn Profile Review',
    description: 'Strengthen your LinkedIn presence to attract recruiters in the aviation maintenance industry.',
    icon: 'M13.19 8.688a4.5 4.5 0 0 1 1.242 7.244l-4.5 4.5a4.5 4.5 0 0 1-6.364-6.364l1.757-1.757m13.35-.622 1.757-1.757a4.5 4.5 0 0 0-6.364-6.364l-4.5 4.5a4.5 4.5 0 0 0 1.242 7.244',
    bullets: ['Profile headline & summary optimisation', 'Skills & endorsement strategy', 'Recruiter visibility tips'],
  },
  {
    calSlug: 'mock-exam',
    title: 'Mock Oral Exam',
    description: 'Practice your Part-66 oral examination with an experienced examiner in a realistic environment.',
    icon: 'M4.5 12a7.5 7.5 0 0 0 15 0m-15 0a7.5 7.5 0 1 1 15 0m-15 0H3m16.5 0H21m-1.5 0H12m-8.457 3.077 1.41-.513m14.095-5.13 1.41-.513M5.106 17.785l1.15-.964m11.49-9.642 1.149-.964M7.501 19.795l.75-1.3m7.5-12.99.75-1.3m-6.063 16.658.26-1.477m2.605-14.772.26-1.477m0 17.726-.26-1.477M10.698 4.614l-.26-1.477M16.5 19.794l-.75-1.299M7.5 4.205 6.75 2.906',
    bullets: ['Simulates real examiner questioning style', 'Detailed feedback report after session', 'Available for B1 and B2 candidates'],
  },
]

interface CalFn {
  (...args: unknown[]): void
  loaded?: boolean
  ns?: Record<string, CalFn>
  q?: unknown[][]
}

declare global {
  interface Window {
    Cal?: CalFn
  }
}

// Cal.com's official bootstrap snippet. IMPORTANT: the real embed.js script
// (loaded below) expects `window.Cal` to already exist as this queueing stub
// — it attaches its real implementation onto it rather than creating
// `window.Cal` itself. Loading embed.js first and calling window.Cal()
// afterwards (the naive approach) fails with "Cal is not defined".
function bootstrapCal() {
  if (window.Cal) return
  const queue = (fn: CalFn, args: unknown[]) => {
    fn.q = fn.q || []
    fn.q.push(args)
  }
  const cal: CalFn = (...args: unknown[]) => {
    if (!cal.loaded) {
      cal.ns = {}
      cal.q = cal.q || []
      const script = document.createElement('script')
      script.src = 'https://app.cal.com/embed/embed.js'
      document.head.appendChild(script)
      cal.loaded = true
    }
    if (args[0] === 'init') {
      const namespace = args[1] as string | undefined
      if (typeof namespace === 'string') {
        const nsApi: CalFn = cal.ns![namespace] || ((...a: unknown[]) => queue(nsApi, a))
        cal.ns![namespace] = nsApi
        queue(nsApi, args)
        queue(cal, ['initNamespace', namespace])
        return
      }
    }
    queue(cal, args)
  }
  window.Cal = cal
}

function initCal(slug: string) {
  bootstrapCal()
  if (!calContainer.value || !window.Cal) return

  // Clear previous embed
  calContainer.value.innerHTML = ''
  const el = document.createElement('div')
  el.style.cssText = 'width:100%;min-height:620px'
  calContainer.value.appendChild(el)

  window.Cal('init', { origin: 'https://cal.com' })
  window.Cal('inline', {
    elementOrSelector: el,
    calLink: `${CAL_USERNAME}/${slug}`,
    layout: 'month_view',
    theme: 'light',
  })
}

function selectService(slug: string) {
  selected.value = slug
}

watch(selected, (slug) => initCal(slug))

onMounted(() => initCal(selected.value))
</script>
