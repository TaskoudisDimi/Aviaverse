import { defineStore } from 'pinia'
import { ref, computed } from 'vue'
import { api } from '@/lib/api'

interface User {
  id: string
  email: string
  full_name: string
  licence_type: string
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

  async function fetchMe() {
    const res = await api.get('/api/v1/auth/me')
    user.value = res.data
  }

  function logout() {
    token.value = null
    user.value = null
    localStorage.removeItem('token')
  }

  // Restore session on app load
  if (token.value) {
    fetchMe().catch(() => logout())
  }

  return { token, user, isAuthenticated, login, register, logout, fetchMe }
})
