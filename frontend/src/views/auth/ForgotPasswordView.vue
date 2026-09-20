<template>
  <form v-if="!sent" @submit.prevent="submit" class="space-y-5">
    <div>
      <h1 class="text-xl font-semibold text-slate-900">Reset your password</h1>
      <p class="text-sm text-slate-500 mt-1">Enter your email and we'll send you a reset link</p>
    </div>

    <div v-if="error" class="bg-red-50 border border-red-200 rounded-lg px-4 py-3 text-red-600 text-sm">
      {{ error }}
    </div>

    <div>
      <label class="block text-sm font-medium text-slate-700 mb-1.5">Email</label>
      <input v-model="email" type="email" required autocomplete="email"
        class="w-full bg-white border border-slate-300 rounded-xl px-4 py-2.5 text-slate-900 placeholder-slate-400
               focus:outline-none focus:ring-2 focus:ring-aviation-500 focus:border-transparent text-sm"
        placeholder="you@example.com" />
    </div>

    <button type="submit" :disabled="loading"
      class="w-full bg-aviation-500 hover:bg-aviation-600 disabled:opacity-50 disabled:cursor-not-allowed
             text-white font-medium py-2.5 rounded-xl transition-colors text-sm">
      {{ loading ? 'Sending…' : 'Send reset link' }}
    </button>

    <p class="text-center text-sm text-slate-500">
      <RouterLink to="/auth/login" class="text-aviation-600 hover:text-aviation-700 font-medium">‹ Back to sign in</RouterLink>
    </p>
  </form>

  <div v-else class="space-y-5 text-center">
    <div class="w-12 h-12 rounded-full bg-green-50 border border-green-200 flex items-center justify-center mx-auto">
      <svg class="w-6 h-6 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"/>
      </svg>
    </div>
    <div>
      <h1 class="text-xl font-semibold text-slate-900">Check your email</h1>
      <p class="text-sm text-slate-500 mt-1">If an account exists for <span class="font-medium text-slate-700">{{ email }}</span>, we've sent a link to reset your password. It expires in 1 hour.</p>
    </div>
    <RouterLink to="/auth/login" class="inline-block text-sm text-aviation-600 hover:text-aviation-700 font-medium">‹ Back to sign in</RouterLink>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import { RouterLink } from 'vue-router'
import { api } from '@/lib/api'

const email = ref('')
const loading = ref(false)
const error = ref('')
const sent = ref(false)

async function submit() {
  loading.value = true
  error.value = ''
  try {
    await api.post('/api/v1/auth/forgot-password', { email: email.value })
    sent.value = true
  } catch (e: unknown) {
    error.value = (e as { response?: { data?: { error?: string } } })?.response?.data?.error ?? 'Something went wrong. Please try again.'
  } finally {
    loading.value = false
  }
}
</script>
