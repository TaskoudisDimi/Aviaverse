<template>
  <div class="relative min-h-screen flex items-center justify-center bg-navy-900 p-4 overflow-hidden">
    <svg class="absolute inset-0 w-full h-full pointer-events-none" preserveAspectRatio="xMidYMid slice" viewBox="0 0 1600 1000" aria-hidden="true">
      <defs>
        <linearGradient id="authBgBase" x1="0%" y1="0%" x2="100%" y2="100%">
          <stop offset="0%" stop-color="#0f172a"/>
          <stop offset="100%" stop-color="#0a0e1a"/>
        </linearGradient>
        <radialGradient id="authGlow" cx="50%" cy="50%" r="50%">
          <stop offset="0%" stop-color="#598bff" stop-opacity="0.3"/>
          <stop offset="55%" stop-color="#598bff" stop-opacity="0.08"/>
          <stop offset="100%" stop-color="#598bff" stop-opacity="0"/>
        </radialGradient>
      </defs>
      <rect x="0" y="0" width="1600" height="1000" fill="url(#authBgBase)"/>
      <circle cx="800" cy="500" r="520" fill="url(#authGlow)"/>
      <g stroke="#8eb5ff" stroke-width="1.25" fill="none" opacity="0.35">
        <circle cx="800" cy="500" r="160"/>
        <circle cx="800" cy="500" r="280"/>
        <circle cx="800" cy="500" r="400"/>
        <circle cx="800" cy="500" r="520"/>
      </g>
    </svg>
    <div class="relative w-full max-w-md">
      <div class="text-center mb-8">
        <RouterLink to="/" class="inline-flex items-center gap-2 mb-2 hover:opacity-80 transition-opacity">
          <img src="/favicon.png" alt="" class="w-9 h-9" />
          <span class="text-2xl font-bold tracking-tight text-white">VJet-Academy</span>
        </RouterLink>
        <p class="text-slate-300 text-sm">EASA Part-66 Aviation Maintenance Training</p>
      </div>
      <div class="bg-white rounded-2xl shadow-sm p-6 sm:p-8 border border-slate-200">
        <RouterView />
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { RouterView, RouterLink } from 'vue-router'
</script>
