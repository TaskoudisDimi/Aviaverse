<template>
  <div class="min-h-screen flex items-center justify-center bg-navy-900 p-4">
    <div class="w-full max-w-md">
      <div class="text-center mb-8">
        <div class="inline-flex items-center gap-2 text-aviation-400 mb-2">
          <svg class="w-8 h-8" fill="currentColor" viewBox="0 0 24 24">
            <path d="M21 16v-2l-8-5V3.5a1.5 1.5 0 0 0-3 0V9l-8 5v2l8-2.5V19l-2 1.5V22l3.5-1 3.5 1v-1.5L13 19v-5.5z"/>
          </svg>
          <span class="text-2xl font-bold tracking-tight">Aviaverse Academy</span>
        </div>
        <p class="text-slate-400 text-sm">EASA Part-66 Aviation Maintenance Training</p>
      </div>
      <div class="bg-navy-800 rounded-2xl shadow-xl p-8 border border-slate-700/50">
        <RouterView />
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { RouterView } from 'vue-router'
</script>
