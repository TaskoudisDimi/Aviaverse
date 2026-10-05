<template>
  <div class="min-h-full">
    <div class="bg-white border-b border-slate-200 px-4 sm:px-6 py-8">
      <div class="max-w-5xl mx-auto text-center">
        <h1 class="text-2xl font-bold text-slate-900">Pricing</h1>
        <p class="text-slate-500 text-sm mt-1">Simple plans for EASA Part-66 study, exam prep and AI tutoring.</p>
      </div>
    </div>

    <div class="p-4 sm:p-6 max-w-5xl mx-auto">
      <div v-if="loading" class="flex justify-center py-12"><Spinner /></div>

      <div v-else class="grid sm:grid-cols-3 gap-5">
        <div v-for="p in plans" :key="p.code"
          class="bg-white border-2 rounded-2xl p-6 flex flex-col"
          :class="p.code === currentCode ? 'border-aviation-500' : 'border-slate-200'">
          <p class="font-semibold text-slate-900">{{ p.name }}</p>
          <p class="text-3xl font-bold text-slate-900 mt-3">{{ formatPrice(p.price_cents, p.currency) }}</p>
          <p class="text-xs text-slate-400 mb-5">{{ p.period_days ? `every ${p.period_days} days` : 'no expiry' }}</p>

          <ul class="text-sm text-slate-600 space-y-2 flex-1">
            <li class="flex items-start gap-2">
              <CheckIcon class="w-4 h-4 text-aviation-500 mt-0.5 shrink-0" />
              {{ p.ai_message_cap }} AI Instructor messages / month
            </li>
            <li class="flex items-start gap-2">
              <CheckIcon class="w-4 h-4 text-aviation-500 mt-0.5 shrink-0" />
              {{ p.allowed_module_codes?.length ? `Access to ${p.allowed_module_codes.length} module(s)` : 'Access to all 17 modules' }}
            </li>
            <li class="flex items-start gap-2">
              <CheckIcon class="w-4 h-4 text-aviation-500 mt-0.5 shrink-0" />
              Exam Simulator practice
            </li>
          </ul>

          <p v-if="p.code === currentCode" class="text-xs font-medium text-aviation-600 mt-5 text-center">Your current plan</p>
          <RouterLink v-else-if="auth.isAuthenticated" to="/settings"
            class="mt-5 w-full text-center text-sm font-medium bg-white border border-aviation-300 text-aviation-700
                   hover:bg-aviation-50 rounded-xl py-2.5 transition-colors">
            Switch in Settings
          </RouterLink>
          <RouterLink v-else to="/auth/register"
            class="mt-5 w-full text-center text-sm font-medium bg-aviation-500 hover:bg-aviation-600 text-white rounded-xl py-2.5 transition-colors">
            Get Started
          </RouterLink>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted, h } from 'vue'
import { RouterLink } from 'vue-router'
import { useAuthStore } from '@/stores/auth'
import { api } from '@/lib/api'
import Spinner from '@/components/Spinner.vue'

interface PlanListItem {
  code: string
  name: string
  price_cents: number
  currency: string
  period_days: number | null
  ai_message_cap: number
  allowed_module_codes: string[] | null
}

const auth = useAuthStore()
const loading = ref(true)
const plans = ref<PlanListItem[]>([])
const currentCode = computed(() => auth.user?.plan?.code)

const CheckIcon = {
  render() {
    return h('svg', { viewBox: '0 0 24 24', fill: 'none', stroke: 'currentColor', 'stroke-width': '2' },
      [h('path', { 'stroke-linecap': 'round', 'stroke-linejoin': 'round', d: 'M4.5 12.75l6 6 9-13.5' })])
  }
}

function formatPrice(cents: number, currency: string) {
  if (cents === 0) return 'Free'
  return new Intl.NumberFormat('en-IE', { style: 'currency', currency }).format(cents / 100)
}

onMounted(async () => {
  const res = await api.get('/api/v1/auth/plans')
  plans.value = res.data
  loading.value = false
})
</script>
