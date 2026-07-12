<template>
  <form @submit.prevent="submit" class="space-y-5">
    <div>
      <h1 class="text-xl font-semibold text-white">Create account</h1>
      <p class="text-sm text-slate-400 mt-1">Start your EASA Part-66 training</p>
    </div>

    <div v-if="error" class="bg-red-900/30 border border-red-500/50 rounded-lg px-4 py-3 text-red-300 text-sm">
      {{ error }}
    </div>

    <div class="space-y-4">
      <div>
        <label class="block text-sm font-medium text-slate-300 mb-1.5">Full name</label>
        <input v-model="name" type="text" required
          class="w-full bg-navy-900 border border-slate-600 rounded-xl px-4 py-2.5 text-white placeholder-slate-500
                 focus:outline-none focus:ring-2 focus:ring-aviation-500 focus:border-transparent text-sm"
          placeholder="Alex Rodriguez" />
      </div>
      <div>
        <label class="block text-sm font-medium text-slate-300 mb-1.5">Email</label>
        <input v-model="email" type="email" required autocomplete="email"
          class="w-full bg-navy-900 border border-slate-600 rounded-xl px-4 py-2.5 text-white placeholder-slate-500
                 focus:outline-none focus:ring-2 focus:ring-aviation-500 focus:border-transparent text-sm"
          placeholder="you@example.com" />
      </div>
      <div>
        <label class="block text-sm font-medium text-slate-300 mb-1.5">Password</label>
        <input v-model="password" type="password" required minlength="8" autocomplete="new-password"
          class="w-full bg-navy-900 border border-slate-600 rounded-xl px-4 py-2.5 text-white placeholder-slate-500
                 focus:outline-none focus:ring-2 focus:ring-aviation-500 focus:border-transparent text-sm"
          placeholder="Min. 8 characters" />
      </div>
      <div>
        <label class="block text-sm font-medium text-slate-300 mb-1.5">Licence type</label>
        <select v-model="licenceType" required
          class="w-full bg-navy-900 border border-slate-600 rounded-xl px-4 py-2.5 text-white
                 focus:outline-none focus:ring-2 focus:ring-aviation-500 focus:border-transparent text-sm">
          <option value="" disabled>Select your licence…</option>
          <option value="B1.1">B1.1 – Turbine-powered aeroplanes</option>
          <option value="B1.3">B1.3 – Piston-engine aeroplanes</option>
          <option value="B2">B2 – Avionics</option>
          <option value="all">All licences</option>
        </select>
      </div>
    </div>

    <button type="submit" :disabled="loading"
      class="w-full bg-aviation-600 hover:bg-aviation-500 disabled:opacity-50 disabled:cursor-not-allowed
             text-white font-medium py-2.5 rounded-xl transition-colors text-sm">
      {{ loading ? 'Creating account…' : 'Create account' }}
    </button>

    <p class="text-center text-sm text-slate-400">
      Already have an account?
      <RouterLink to="/auth/login" class="text-aviation-400 hover:text-aviation-300 font-medium">Sign in</RouterLink>
    </p>
  </form>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import { RouterLink, useRouter } from 'vue-router'
import { useAuthStore } from '@/stores/auth'

const auth = useAuthStore()
const router = useRouter()
const name = ref('')
const email = ref('')
const password = ref('')
const licenceType = ref('')
const loading = ref(false)
const error = ref('')

async function submit() {
  loading.value = true
  error.value = ''
  try {
    await auth.register(name.value, email.value, password.value, licenceType.value)
    // register sends full_name to match Go handler
    router.push('/')
  } catch (e: unknown) {
    error.value = (e as { response?: { data?: { error?: string } } })?.response?.data?.error ?? 'Registration failed'
  } finally {
    loading.value = false
  }
}
</script>
