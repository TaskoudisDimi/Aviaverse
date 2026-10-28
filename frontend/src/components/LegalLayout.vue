<template>
  <div class="p-4 sm:p-6 max-w-3xl mx-auto">
    <div class="bg-white border border-slate-200 rounded-2xl p-6 sm:p-10">
      <p class="text-xs font-bold text-aviation-700 bg-aviation-50 inline-block px-2 py-0.5 rounded-lg mb-3">LEGAL</p>
      <h1 class="text-2xl sm:text-3xl font-bold text-slate-900">{{ title }}</h1>
      <p class="text-xs text-slate-400 mt-2">Last updated: {{ lastUpdated }}</p>

      <div class="prose prose-sm max-w-none mt-8
        prose-headings:text-slate-900 prose-headings:font-semibold
        prose-h2:text-base prose-h2:mt-8 prose-h2:mb-3
        prose-h3:text-sm prose-h3:mt-5 prose-h3:mb-2
        prose-p:text-slate-600 prose-p:leading-relaxed
        prose-li:text-slate-600 prose-ul:my-3 prose-ol:my-3
        prose-strong:text-slate-900
        prose-a:text-aviation-600 hover:prose-a:text-aviation-700">
        <slot />
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
defineProps<{ title: string; lastUpdated: string }>()
</script>
