<template>
  <div v-if="clientId">
    <div class="relative flex items-center py-1">
      <div class="flex-1 border-t border-slate-200" />
      <span class="px-3 text-xs text-slate-400 uppercase tracking-wide">or</span>
      <div class="flex-1 border-t border-slate-200" />
    </div>
    <div ref="buttonEl" class="flex justify-center" />
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useAuthStore } from '@/stores/auth'

const emit = defineEmits<{ error: [message: string]; success: [] }>()

const auth = useAuthStore()
const clientId = import.meta.env.VITE_GOOGLE_CLIENT_ID as string | undefined
const buttonEl = ref<HTMLElement | null>(null)

declare global {
  interface Window {
    google?: {
      accounts: {
        id: {
          initialize: (config: { client_id: string; callback: (resp: { credential: string }) => void }) => void
          renderButton: (el: HTMLElement, options: Record<string, unknown>) => void
        }
      }
    }
  }
}

function loadScript(): Promise<void> {
  return new Promise((resolve, reject) => {
    if (window.google?.accounts?.id) return resolve()
    const script = document.createElement('script')
    script.src = 'https://accounts.google.com/gsi/client'
    script.async = true
    script.defer = true
    script.onload = () => resolve()
    script.onerror = () => reject(new Error('Failed to load Google script'))
    document.head.appendChild(script)
  })
}

async function handleCredential(resp: { credential: string }) {
  try {
    await auth.loginWithGoogle(resp.credential)
    emit('success')
  } catch (e: unknown) {
    const message = (e as { response?: { data?: { error?: string } } })?.response?.data?.error ?? 'Google sign-in failed'
    emit('error', message)
  }
}

onMounted(async () => {
  if (!clientId || !buttonEl.value) return
  try {
    await loadScript()
    window.google!.accounts.id.initialize({ client_id: clientId, callback: handleCredential })
    window.google!.accounts.id.renderButton(buttonEl.value, { theme: 'outline', size: 'large', width: 320 })
  } catch {
    // If Google's script fails to load (network block, ad-blocker, etc.)
    // the button simply doesn't render — email/password login still works.
  }
})
</script>
