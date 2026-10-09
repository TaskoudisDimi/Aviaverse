<template>
  <div class="p-4 sm:p-6 max-w-4xl mx-auto space-y-8">
    <div>
      <h1 class="text-2xl font-bold text-slate-900">Settings</h1>
      <p class="text-slate-500 text-sm mt-1">Your profile and subscription plan</p>
    </div>

    <div v-if="notice" class="bg-green-50 border border-green-200 rounded-lg px-4 py-3 text-green-700 text-sm">
      {{ notice }}
    </div>

    <!-- Profile -->
    <div class="bg-white border border-slate-200 rounded-2xl p-6">
      <div class="flex items-center justify-between mb-4">
        <h2 class="text-base font-semibold text-slate-900">Profile</h2>
        <button v-if="!editingProfile" @click="startEditProfile"
          class="text-sm font-medium text-aviation-600 hover:text-aviation-700">Edit</button>
      </div>

      <div class="flex items-center gap-4 mb-6">
        <div class="w-14 h-14 rounded-full bg-aviation-500 flex items-center justify-center text-xl font-bold text-white flex-shrink-0">
          {{ userInitial }}
        </div>
        <div>
          <p class="font-medium text-slate-900">{{ auth.user?.full_name }}</p>
          <p class="text-sm text-slate-500">{{ auth.user?.email }}</p>
        </div>
      </div>

      <form v-if="editingProfile" @submit.prevent="saveProfile" class="space-y-4">
        <div>
          <label class="block text-sm font-medium text-slate-700 mb-1.5">Full name</label>
          <input v-model="form.fullName" required
            class="w-full bg-white border border-slate-300 rounded-xl px-4 py-2.5 text-slate-900 text-sm
                   focus:outline-none focus:ring-2 focus:ring-aviation-500 focus:border-transparent" />
        </div>
        <div>
          <label class="block text-sm font-medium text-slate-700 mb-1.5">Licence type</label>
          <select v-model="form.licenceType" required
            class="w-full bg-white border border-slate-300 rounded-xl px-4 py-2.5 text-slate-900 text-sm
                   focus:outline-none focus:ring-2 focus:ring-aviation-500 focus:border-transparent">
            <option value="B1.1">B1.1 – Turbine-powered aeroplanes</option>
            <option value="B1.3">B1.3 – Piston-engine aeroplanes</option>
            <option value="B2">B2 – Avionics</option>
            <option value="all">All licences</option>
          </select>
        </div>
        <div v-if="profileError" class="text-sm text-red-600">{{ profileError }}</div>
        <div class="flex gap-3">
          <button type="submit" :disabled="savingProfile"
            class="bg-aviation-500 hover:bg-aviation-600 disabled:opacity-50 text-white text-sm font-medium px-4 py-2 rounded-xl transition-colors">
            {{ savingProfile ? 'Saving…' : 'Save changes' }}
          </button>
          <button type="button" @click="editingProfile = false"
            class="text-sm font-medium text-slate-500 hover:text-slate-700 px-4 py-2">Cancel</button>
        </div>
      </form>
      <dl v-else class="grid sm:grid-cols-2 gap-4 text-sm">
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
            <span v-if="plan.cancel_at_period_end" class="text-red-600 font-medium"> · won't renew — cancels at period end</span>
            <span v-else-if="plan.billing_mode === 'recurring' && plan.expires_at"> · renews {{ formatDate(plan.expires_at) }}</span>
            <span v-else-if="plan.billing_mode === 'one_time' && plan.expires_at"> · access until {{ formatDate(plan.expires_at) }}</span>
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
          <p v-if="plan.cancel_at_period_end" class="text-slate-400 font-medium text-xs self-start">
            Cancellation scheduled
          </p>
          <button v-else-if="plan.billing_mode === 'recurring' && plan.payment_provider === 'stripe'"
            @click="showCancelModal = true"
            class="text-red-600 hover:text-red-700 font-medium text-xs self-start">
            Cancel subscription
          </button>
        </div>
      </div>
      <p v-else class="text-sm text-slate-400">Loading your plan…</p>
    </div>

    <!-- Cancel subscription modal -->
    <Transition name="fade">
      <div v-if="showCancelModal" class="fixed inset-0 z-50 flex items-center justify-center p-4">
        <div class="absolute inset-0 bg-slate-900/40" @click="showCancelModal = false" />
        <div class="relative bg-white rounded-2xl shadow-xl w-full max-w-sm p-6">
          <h3 class="text-base font-semibold text-slate-900 mb-2">Cancel your subscription?</h3>
          <p class="text-sm text-slate-500 mb-6">
            You'll keep full access to <span class="font-medium text-slate-700">{{ plan?.name }}</span>
            until the end of the current billing period — you just won't be charged again after that.
          </p>
          <div class="flex justify-end gap-3">
            <button @click="showCancelModal = false"
              class="text-sm font-medium text-slate-500 hover:text-slate-700 px-4 py-2 rounded-xl">
              Keep subscription
            </button>
            <button @click="confirmCancelSubscription" :disabled="canceling"
              class="text-sm font-medium bg-red-500 hover:bg-red-600 disabled:opacity-50 text-white px-4 py-2 rounded-xl transition-colors">
              {{ canceling ? 'Canceling…' : 'Cancel subscription' }}
            </button>
          </div>
        </div>
      </div>
    </Transition>

    <!-- Available plans -->
    <div class="bg-white border border-slate-200 rounded-2xl p-6">
      <h2 class="text-base font-semibold text-slate-900 mb-1">Available plans</h2>
      <p class="text-sm text-slate-500 mb-5">
        Paid plans are handled securely by Stripe - you'll be redirected to complete payment.
      </p>
      <div v-if="planError" class="bg-red-50 border border-red-200 rounded-lg px-4 py-3 text-red-600 text-sm mb-4">
        {{ planError }}
      </div>
      <div v-if="allPlans.length" class="grid sm:grid-cols-3 gap-4">
        <div v-for="p in allPlans" :key="p.code"
          class="rounded-xl p-4 border-2 flex flex-col"
          :class="p.code === plan?.code ? 'border-aviation-500 bg-aviation-50' : 'border-slate-200'">
          <p class="font-semibold text-slate-900">{{ p.name }}</p>
          <p class="text-2xl font-bold text-slate-900 mt-2">
            {{ formatPrice(p.price_cents, p.currency) }}
          </p>
          <p class="text-xs text-slate-400 mb-3">
            {{ p.period_days ? `every ${p.period_days} days` : 'no expiry' }}
          </p>
          <ul class="text-sm text-slate-600 space-y-1 flex-1">
            <li>{{ p.ai_message_cap }} AI messages / month</li>
            <li>{{ p.allowed_module_codes?.length ? `${p.allowed_module_codes.length} module(s)` : 'All modules' }}</li>
          </ul>
          <p v-if="p.code === plan?.code" class="text-xs font-medium text-aviation-600 mt-3">Current plan</p>
          <button v-else-if="p.billing_mode === 'free'" @click="switchPlan(p.code)" :disabled="switchingTo !== null"
            class="mt-3 w-full text-sm font-medium bg-white border border-aviation-300 text-aviation-700
                   hover:bg-aviation-50 disabled:opacity-50 rounded-xl py-2 transition-colors">
            {{ switchingTo === p.code ? 'Switching…' : 'Switch to this plan' }}
          </button>
          <button v-else @click="subscribe(p.code)" :disabled="checkingOutTo !== null"
            class="mt-3 w-full text-sm font-medium bg-aviation-500 hover:bg-aviation-600 text-white
                   disabled:opacity-50 rounded-xl py-2 transition-colors">
            {{ checkingOutTo === p.code ? 'Redirecting…' : 'Subscribe' }}
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, computed, onMounted } from 'vue'
import { useRoute } from 'vue-router'
import { useAuthStore } from '@/stores/auth'
import { api } from '@/lib/api'

const auth = useAuthStore()
const route = useRoute()

const userInitial = computed(() => auth.user?.full_name?.[0]?.toUpperCase() ?? '?')
const plan = computed(() => auth.user?.plan)

const memberSince = computed(() => {
  const created = auth.user?.created_at
  return created ? formatDate(created) : '—'
})

// Profile editing
const editingProfile = ref(false)
const savingProfile = ref(false)
const profileError = ref('')
const form = reactive({ fullName: '', licenceType: '' })

function startEditProfile() {
  form.fullName = auth.user?.full_name ?? ''
  form.licenceType = auth.user?.licence_type ?? ''
  profileError.value = ''
  editingProfile.value = true
}

const notice = ref('')
function flashNotice(msg: string) {
  notice.value = msg
  setTimeout(() => { if (notice.value === msg) notice.value = '' }, 4000)
}

async function saveProfile() {
  savingProfile.value = true
  profileError.value = ''
  try {
    await auth.updateProfile(form.fullName, form.licenceType)
    editingProfile.value = false
    flashNotice('Profile updated.')
  } catch (e: unknown) {
    profileError.value = (e as { response?: { data?: { error?: string } } })?.response?.data?.error ?? 'Could not save changes.'
  } finally {
    savingProfile.value = false
  }
}

// Plan switching
interface PlanListItem {
  code: string
  name: string
  price_cents: number
  currency: string
  period_days: number | null
  ai_message_cap: number
  allowed_module_codes: string[] | null
  billing_mode: 'free' | 'recurring' | 'one_time'
}

const allPlans = ref<PlanListItem[]>([])
const switchingTo = ref<string | null>(null)
const checkingOutTo = ref<string | null>(null)
const canceling = ref(false)
const showCancelModal = ref(false)
const planError = ref('')

async function switchPlan(code: string) {
  switchingTo.value = code
  planError.value = ''
  try {
    await auth.changePlan(code)
    flashNotice('Plan updated.')
  } catch (e: unknown) {
    planError.value = (e as { response?: { data?: { error?: string } } })?.response?.data?.error ?? 'Could not switch plans.'
  } finally {
    switchingTo.value = null
  }
}

async function subscribe(code: string) {
  checkingOutTo.value = code
  planError.value = ''
  try {
    const url = await auth.startCheckout(code)
    window.location.href = url
  } catch (e: unknown) {
    planError.value = (e as { response?: { data?: { error?: string } } })?.response?.data?.error ?? 'Could not start checkout.'
    checkingOutTo.value = null
  }
}

async function confirmCancelSubscription() {
  canceling.value = true
  planError.value = ''
  try {
    const message = await auth.cancelSubscription()
    showCancelModal.value = false
    flashNotice(message)
  } catch (e: unknown) {
    planError.value = (e as { response?: { data?: { error?: string } } })?.response?.data?.error ?? 'Could not cancel subscription.'
  } finally {
    canceling.value = false
  }
}

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

  if (route.query.checkout === 'success') {
    await auth.fetchMe()
    flashNotice('Payment received - your plan is now active.')
  }
})
</script>

<style>
.fade-enter-active, .fade-leave-active { transition: opacity 0.15s ease; }
.fade-enter-from, .fade-leave-to { opacity: 0; }
</style>
