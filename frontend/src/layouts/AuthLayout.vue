<template>
  <div class="min-h-screen flex items-center justify-center bg-slate-50 p-4">
    <div class="w-full max-w-md">
      <div class="text-center mb-8">
        <div class="inline-flex items-center gap-2 mb-2">
          <img src="/favicon.png" alt="" class="w-9 h-9" />
          <span class="text-2xl font-bold tracking-tight text-slate-900">VJet-Academy</span>
        </div>
        <p class="text-slate-500 text-sm">EASA Part-66 Aviation Maintenance Training</p>
      </div>
      <div class="bg-white rounded-2xl shadow-sm p-6 sm:p-8 border border-slate-200">
        <RouterView />
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { RouterView } from 'vue-router'
</script>
