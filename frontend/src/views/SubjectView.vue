<template>
  <div class="p-6 max-w-4xl mx-auto space-y-6">
    <div v-if="loading" class="flex justify-center py-12"><Spinner /></div>

    <template v-else-if="subject">
      <RouterLink :to="`/modules/${subject.module_id}`"
        class="text-sm text-slate-400 hover:text-aviation-300 flex items-center gap-1 transition-colors">
        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"/>
        </svg>
        Back to module
      </RouterLink>

      <div class="border-b border-slate-700/50 pb-4">
        <span class="text-xs font-mono text-aviation-400 bg-aviation-900/30 px-2 py-0.5 rounded-lg">{{ subject.code }}</span>
        <h1 class="text-2xl font-bold text-white mt-2">{{ subject.title }}</h1>
      </div>

      <!-- Theory content -->
      <div v-if="subject.content"
        class="bg-navy-800 rounded-2xl p-6 border border-slate-700/50
               prose prose-invert prose-sm max-w-none
               prose-headings:text-aviation-300 prose-headings:font-semibold
               prose-h1:text-xl prose-h2:text-lg prose-h3:text-base
               prose-strong:text-white prose-strong:font-semibold
               prose-table:text-sm prose-th:text-aviation-300 prose-th:bg-navy-900/60
               prose-td:border-slate-700 prose-th:border-slate-700
               prose-code:text-aviation-300 prose-code:bg-navy-900/60 prose-code:px-1 prose-code:rounded
               prose-li:text-slate-300 prose-p:text-slate-300
               prose-a:text-aviation-400 hover:prose-a:text-aviation-300"
        v-html="renderedContent" />

      <div v-else
        class="bg-navy-800 rounded-2xl p-8 border border-slate-700/50 text-center">
        <svg class="w-12 h-12 text-slate-600 mx-auto mb-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5"
            d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"/>
        </svg>
        <p class="text-slate-400 italic">Theory content coming soon.</p>
        <p class="text-slate-500 text-sm mt-1">Use the AI Instructor below to learn this topic.</p>
      </div>

      <!-- AI quick-launch -->
      <div class="bg-aviation-900/20 border border-aviation-500/30 rounded-2xl p-5 flex items-center justify-between gap-4">
        <div>
          <p class="font-medium text-white">Need help understanding this topic?</p>
          <p class="text-sm text-slate-400 mt-0.5">Ask the AI Instructor for explanations, examples, or an oral exam.</p>
        </div>
        <RouterLink :to="{ name: 'ai', query: { subject: subject.title } }"
          class="flex-shrink-0 bg-aviation-600 hover:bg-aviation-500 text-white text-sm font-medium px-4 py-2 rounded-xl transition-colors">
          Ask AI
        </RouterLink>
      </div>
    </template>

    <div v-else class="text-center py-12 text-slate-400">Subject not found.</div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { RouterLink, useRoute } from 'vue-router'
import { marked } from 'marked'
import { api } from '@/lib/api'
import Spinner from '@/components/Spinner.vue'

interface Subject {
  id: number
  module_id: number
  code: string
  title: string
  content: string
}

const route = useRoute()
const loading = ref(true)
const subject = ref<Subject | null>(null)

onMounted(async () => {
  const res = await api.get(`/api/v1/content/subjects/${route.params.id}`)
  subject.value = res.data
  loading.value = false
})

const renderedContent = computed(() =>
  subject.value?.content ? marked.parse(subject.value.content) as string : ''
)
</script>
