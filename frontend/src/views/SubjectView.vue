<template>
  <div class="p-6 max-w-4xl mx-auto space-y-6">
    <div v-if="loading" class="flex justify-center py-12"><Spinner /></div>

    <template v-else-if="subject">
      <RouterLink :to="`/modules/${subject.module_id}`" class="text-sm text-slate-400 hover:text-white flex items-center gap-1">
        ‹ Back to module
      </RouterLink>

      <div>
        <span class="text-xs font-mono text-slate-400">{{ subject.code }}</span>
        <h1 class="text-2xl font-bold text-white mt-1">{{ subject.title }}</h1>
      </div>

      <!-- Theory content -->
      <div class="bg-navy-800 rounded-2xl p-6 border border-slate-700/50 prose prose-invert prose-sm max-w-none">
        <div v-if="subject.content" v-html="renderedContent" />
        <p v-else class="text-slate-400 italic">Theory content coming soon. Use the AI Instructor to learn this topic.</p>
      </div>

      <!-- AI quick-launch -->
      <div class="bg-aviation-900/20 border border-aviation-500/30 rounded-2xl p-5 flex items-center justify-between">
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
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { RouterLink, useRoute } from 'vue-router'
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

// Simple markdown-like newline → <br> rendering; real app would use marked.js
const renderedContent = computed(() =>
  subject.value?.content
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/\n\n/g, '</p><p class="mt-4">')
    .replace(/\n/g, '<br />')
    .replace(/^/, '<p>')
    .replace(/$/, '</p>') ?? ''
)
</script>
