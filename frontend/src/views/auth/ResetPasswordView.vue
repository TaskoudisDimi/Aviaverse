<template>
  <div v-if="!token" class="text-center space-y-4">
    <h1 class="text-xl font-semibold text-slate-900">Invalid reset link</h1>
    <p class="text-sm text-slate-500">This password reset link is missing its token. Request a new one below.</p>
    <RouterLink to="/auth/forgot-password"
      class="inline-block bg-aviation-500 hover:bg-aviation-600 text-white text-sm font-medium px-5 py-2.5 rounded-xl transition-colors">
      Request new link
    </RouterLink>
  </div>

  <form v-else-if="!done" @submit.prevent="submit" class="space-y-5">
    <div>
      <h1 class="text-xl font-semibold text-slate-900">Choose a new password</h1>
      <p class="text-sm text-slate-500 mt-1">Must be at least 8 characters</p>
    </div>

    <div v-if="error" class="bg-red-50 border border-red-200 rounded-lg px-4 py-3 text-red-600 text-sm">
      {{ error }}
    </div>

    <div class="space-y-4">
      <div>
        <label class="block text-sm font-medium text-slate-700 mb-1.5">New password</label>
        <input v-model="password" type="password" required minlength="8" autocomplete="new-password"
          class="w-full bg-white border border-slate-300 rounded-xl px-4 py-2.5 text-slate-900 placeholder-slate-400
                 focus:outline-none focus:ring-2 focus:ring-aviation-500 focus:border-transparent text-sm"
          placeholder="Min. 8 characters" />
      </div>
      <div>
        <label class="block text-sm font-medium text-slate-700 mb-1.5">Confirm password</label>
        <input v-model="confirm" type="password" required minlength="8" autocomplete="new-password"
          class="w-full bg-white border border-slate-300 rounded-xl px-4 py-2.5 text-slate-900 placeholder-slate-400
                 focus:outline-none focus:ring-2 focus:ring-aviation-500 focus:border-transparent text-sm"
          placeholder="Re-enter password" />
      </div>
    </div>

    <button type="submit" :disabled="loading"
      class="w-full bg-aviation-500 hover:bg-aviation-600 disabled:opacity-50 disabled:cursor-not-allowed
             text-white font-medium py-2.5 rounded-xl transition-colors text-sm">
      {{ loading ? 'Updating…' : 'Update password' }}
    </button>
  </form>

  <div v-else class="space-y-5 text-center">
    <div class="w-12 h-12 rounded-full bg-green-50 border border-green-200 flex items-center justify-center mx-auto">
      <svg class="w-6 h-6 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.5 12.75l6 6 9-13.5"/>
      </svg>
    </div>
    <div>
      <h1 class="text-xl font-semibold text-slate-900">Password updated</h1>
      <p class="text-sm text-slate-500 mt-1">You can now sign in with your new password.</p>
    </div>
    <RouterLink to="/auth/login"
      class="inline-block bg-aviation-500 hover:bg-aviation-600 text-white text-sm font-medium px-5 py-2.5 rounded-xl transition-colors">
      Sign in
    </RouterLink>
  </div>
</template>

<script setup lang="ts">
import { ref, computed } from 'vue'
import { RouterLink, useRoute } from 'vue-router'
import { api } from '@/lib/api'

const route = useRoute()
const token = computed(() => (route.query.token as string) || '')

const password = ref('')
const confirm = ref('')
const loading = ref(false)
const error = ref('')
const done = ref(false)

async function submit() {
  if (password.value !== confirm.value) {
    error.value = 'Passwords do not match.'
    return
  }
  loading.value = true
  error.value = ''
  try {
    await api.post('/api/v1/auth/reset-password', { token: token.value, new_password: password.value })
    done.value = true
  } catch (e: unknown) {
    error.value = (e as { response?: { data?: { error?: string } } })?.response?.data?.error ?? 'Something went wrong. Please try again.'
  } finally {
    loading.value = false
  }
}
</script>
