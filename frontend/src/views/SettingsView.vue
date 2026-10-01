<template>
  <div class="p-4 sm:p-6 max-w-4xl mx-auto space-y-8">
    <div>
      <h1 class="text-2xl font-bold text-slate-900">Settings</h1>
      <p class="text-slate-500 text-sm mt-1">Your profile and subscription plan</p>
    </div>

    <!-- Profile -->
    <div class="bg-white border border-slate-200 rounded-2xl p-6">
      <h2 class="text-base font-semibold text-slate-900 mb-4">Profile</h2>
      <div class="flex items-center gap-4 mb-6">
        <div class="w-14 h-14 rounded-full bg-aviation-500 flex items-center justify-center text-xl font-bold text-white flex-shrink-0">
          {{ userInitial }}
        </div>
        <div>
          <p class="font-medium text-slate-900">{{ auth.user?.full_name }}</p>
          <p class="text-sm text-slate-500">{{ auth.user?.email }}</p>
        </div>
      </div>
      <dl class="grid sm:grid-cols-2 gap-4 text-sm">
        <div>
          <dt class="text-slate-400 text-xs uppercase tracking-wide mb-1">Licence type</dt>
          <dd class="text-slate-900 font-medium">{{ auth.user?.licence_type }}</dd>
        </div>
        <div>
          <dt class="text-slate-400 text-xs uppercase tracking-wide mb-1">Member since</dt>
          <dd class="text-slate-900 font-medium">{{ memberSince }}</dd>
        </div>
      </dl>
    </div>

    <!-- Current plan -->
    <div class="bg-white border border-slate-200 rounded-2xl p-6">
      <h2 class="text-base font-semibold text-slate-900 mb-4">Your plan</h2>
      <div v-if="plan" class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4 bg-aviation-50 border border-aviation-200 rounded-xl p-4">
        <div>
          <p class="font-semibold text-aviation-900">{{ plan.name }}</p>
          <p class="text-sm text-aviation-700 mt-0.5">
            {{ formatPrice(plan.price_cents, plan.currency) }}
            <span v-if="plan.expires_at"> · renews {{ formatDate(plan.expires_at) }}</span>
            <span v-else> · no expiry</span>
          </p>
        </div>
        <div class="flex gap-6 text-sm">
          <div>
            <p class="text-aviation-500 text-xs uppercase tracking-wide">AI messages / month</p>
            <p class="font-semibold text-aviation-900">{{ plan.ai_message_cap }}</p>
          </div>
          <div>
            <p class="text-aviation-500 text-xs uppercase tracking-wide">Module access</p>
            <p class="font-semibold text-aviation-900">
              {{ plan.allowed_module_codes?.length ? plan.allowed_module_codes.join(', ') : 'All modules' }}
            </p>
          </div>
        </div>
      </div>
      <p v-else class="text-sm text-slate-400">Loading your plan…</p>
    </div>

    <!-- Available plans -->
    <div class="bg-white border border-slate-200 rounded-2xl p-6">
      <h2 class="text-base font-semibold text-slate-900 mb-1">Available plans</h2>
      <p class="text-sm text-slate-500 mb-5">Upgrades aren't live yet — reach out if you'd like to change your plan.</p>
      <div v-if="allPlans.length" class="grid sm:grid-cols-3 gap-4">
        <div v-for="p in allPlans" :key="p.code"
          class="rounded-xl p-4 border-2"
          :class="p.code === plan?.code ? 'border-aviation-500 bg-aviation-50' : 'border-slate-200'">
          <p class="font-semibold text-slate-900">{{ p.name }}</p>
          <p class="text-2xl font-bold text-slate-900 mt-2">
            {{ formatPrice(p.price_cents, p.currency) }}
          </p>
          <p class="text-xs text-slate-400 mb-3">
            {{ p.period_days ? `every ${p.period_days} days` : 'no expiry' }}
          </p>
          <ul class="text-sm text-slate-600 space-y-1">
            <li>{{ p.ai_message_cap }} AI messages / month</li>
            <li>{{ p.allowed_module_codes?.length ? `${p.allowed_module_codes.length} module(s)` : 'All modules' }}</li>
          </ul>
          <p v-if="p.code === plan?.code" class="text-xs font-medium text-aviation-600 mt-3">Current plan</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { useAuthStore } from '@/stores/auth'
import { api } from '@/lib/api'

const auth = useAuthStore()

const userInitial = computed(() => auth.user?.full_name?.[0]?.toUpperCase() ?? '?')
const plan = computed(() => auth.user?.plan)

const memberSince = computed(() => {
  const created = (auth.user as { created_at?: string } | null)?.created_at
  return created ? formatDate(created) : '—'
})

interface PlanListItem {
  code: string
  name: string
  price_cents: number
  currency: string
  period_days: number | null
  ai_message_cap: number
  allowed_module_codes: string[] | null
}

const allPlans = ref<PlanListItem[]>([])

function formatPrice(cents: number, currency: string) {
  if (cents === 0) return 'Free'
  return new Intl.NumberFormat('en-IE', { style: 'currency', currency }).format(cents / 100)
}

function formatDate(iso: string) {
  return new Date(iso).toLocaleDateString('en-GB', { year: 'numeric', month: 'short', day: 'numeric' })
}

onMounted(async () => {
  const res = await api.get('/api/v1/auth/plans')
  allPlans.value = res.data
})
</script>
