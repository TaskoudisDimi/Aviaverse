import { defineStore } from 'pinia'
import { ref, computed, watch } from 'vue'
import { api } from '@/lib/api'

interface Plan {
  code: string
  name: string
  price_cents: number
  currency: string
  ai_message_cap: number
  allowed_module_codes: string[] | null
  expires_at: string | null
  billing_mode: 'free' | 'recurring' | 'one_time'
  payment_provider: string | null
  cancel_at_period_end: boolean
}

interface User {
  id: string
  email: string
  full_name: string
  licence_type: string
  created_at: string
  is_admin: boolean
  plan?: Plan
  locked_module_code: string | null
}

export const useAuthStore = defineStore('auth', () => {
  const token = ref<string | null>(localStorage.getItem('token'))
  const user = ref<User | null>(null)

  const isAuthenticated = computed(() => !!token.value)

  function setToken(t: string) {
    token.value = t
    localStorage.setItem('token', t)
  }

  async function login(email: string, password: string) {
    const res = await api.post('/api/v1/auth/login', { email, password })
    setToken(res.data.token)
    await fetchMe()
  }

  async function register(name: string, email: string, password: string, licenceType: string) {
    const res = await api.post('/api/v1/auth/register', { full_name: name, email, password, licence_type: licenceType })
    setToken(res.data.token)
    await fetchMe()
  }

  async function loginWithGoogle(idToken: string) {
    const res = await api.post('/api/v1/auth/google', { id_token: idToken })
    setToken(res.data.token)
    await fetchMe()
  }

  async function fetchMe() {
    const res = await api.get('/api/v1/auth/me')
    user.value = res.data
  }

  async function updateProfile(fullName: string, licenceType: string) {
    await api.patch('/api/v1/auth/me', { full_name: fullName, licence_type: licenceType })
    await fetchMe()
  }

  async function changePlan(planCode: string) {
    await api.post('/api/v1/auth/me/plan', { plan_code: planCode })
    await fetchMe()
  }

  // Returns the Stripe Checkout URL to redirect the browser to.
  async function startCheckout(planCode: string): Promise<string> {
    const res = await api.post('/api/v1/auth/billing/checkout', { plan_code: planCode })
    return res.data.url
  }

  async function cancelSubscription(): Promise<string> {
    const res = await api.post('/api/v1/auth/billing/cancel')
    await fetchMe()
    return res.data.message
  }

  function logout() {
    token.value = null
    user.value = null
    localStorage.removeItem('token')
  }

  // Restore session on app load — expose a promise so the router can await it
  const ready: Promise<void> = token.value
    ? fetchMe().catch((err) => {
        // Only clear session on explicit 401, not on network errors
        if (err?.response?.status === 401) logout()
      })
    : Promise.resolve()

  // Picks up plan/access changes an admin makes elsewhere (e.g. granting
  // custom module access) without the user having to refresh — not
  // instant, but within POLL_INTERVAL_MS of the change. A 401 here is
  // already handled by the global axios interceptor (api.ts), so failures
  // are otherwise just swallowed and retried next tick.
  const POLL_INTERVAL_MS = 30_000
  let pollTimer: ReturnType<typeof setInterval> | null = null

  function startPolling() {
    if (pollTimer) return
    pollTimer = setInterval(() => { fetchMe().catch(() => {}) }, POLL_INTERVAL_MS)
  }

  function stopPolling() {
    if (pollTimer) {
      clearInterval(pollTimer)
      pollTimer = null
    }
  }

  watch(isAuthenticated, (authed) => { authed ? startPolling() : stopPolling() }, { immediate: true })

  return { token, user, isAuthenticated, login, register, loginWithGoogle, logout, fetchMe, updateProfile, changePlan, startCheckout, cancelSubscription, ready }
})
