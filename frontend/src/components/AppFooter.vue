<template>
  <footer class="relative z-10 bg-white border-t border-slate-200 mt-12">
    <div class="max-w-5xl mx-auto px-4 sm:px-6 py-6 flex flex-col sm:flex-row items-center justify-between gap-3 text-xs text-slate-400">
      <p>&copy; {{ year }} VJet-Academy &middot; EASA Part-66 Training</p>
      <a href="mailto:vjetacademy@gmail.com" @click="copyEmail"
        class="hover:text-aviation-600 transition-colors">
        {{ copied ? 'Copied to clipboard ✓' : 'Contact: vjetacademy@gmail.com' }}
      </a>
    </div>
  </footer>
</template>

<script setup lang="ts">
import { ref } from 'vue'

const year = new Date().getFullYear()
const copied = ref(false)

// mailto: silently does nothing when no mail client is configured — copy the
// address too so the link is still useful either way.
async function copyEmail() {
  try {
    await navigator.clipboard.writeText('vjetacademy@gmail.com')
    copied.value = true
    setTimeout(() => { copied.value = false }, 2000)
  } catch {}
}
</script>
