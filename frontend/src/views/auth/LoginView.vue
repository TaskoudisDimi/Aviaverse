<template>
  <form @submit.prevent="submit" class="space-y-5">
    <div>
      <h1 class="text-xl font-semibold text-slate-900">Sign in</h1>
      <p class="text-sm text-slate-500 mt-1">Continue your aviation training journey</p>
    </div>

    <div v-if="error" class="bg-red-50 border border-red-200 rounded-lg px-4 py-3 text-red-600 text-sm">
      {{ error }}
    </div>

    <div class="space-y-4">
      <div>
        <label class="block text-sm font-medium text-slate-700 mb-1.5">Email</label>
        <input v-model="email" type="email" required autocomplete="email"
          class="w-full bg-white border border-slate-300 rounded-xl px-4 py-2.5 text-slate-900 placeholder-slate-400
                 focus:outline-none focus:ring-2 focus:ring-aviation-500 focus:border-transparent text-sm"
          placeholder="you@example.com" />
      </div>
      <div>
        <label class="block text-sm font-medium text-slate-700 mb-1.5">Password</label>
        <input v-model="password" type="password" required autocomplete="current-password"
          class="w-full bg-white border border-slate-300 rounded-xl px-4 py-2.5 text-slate-900 placeholder-slate-400
                 focus:outline-none focus:ring-2 focus:ring-aviation-500 focus:border-transparent text-sm"
          placeholder="••••••••" />
      </div>
    </div>

    <button type="submit" :disabled="loading"
      class="w-full bg-aviation-500 hover:bg-aviation-600 disabled:opacity-50 disabled:cursor-not-allowed
             text-white font-medium py-2.5 rounded-xl transition-colors text-sm">
      {{ loading ? 'Signing in…' : 'Sign in' }}
    </button>

    <p class="text-center text-sm text-slate-500">
      No account?
      <RouterLink to="/auth/register" class="text-aviation-600 hover:text-aviation-700 font-medium">Register</RouterLink>
    </p>
  </form>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import { RouterLink, useRouter } from 'vue-router'
import { useAuthStore } from '@/stores/auth'

const auth = useAuthStore()
const router = useRouter()
const email = ref('')
const password = ref('')
const loading = ref(false)
const error = ref('')

async function submit() {
  loading.value = true
  error.value = ''
  try {
    await auth.login(email.value, password.value)
    router.push('/')
  } catch (e: unknown) {
    error.value = (e as { response?: { data?: { error?: string } } })?.response?.data?.error ?? 'Login failed'
  } finally {
    loading.value = false
  }
}
</script>
