<template>
  <div class="p-6 max-w-4xl mx-auto space-y-6">
    <div v-if="loading" class="flex justify-center py-12"><Spinner /></div>

    <template v-else-if="module">
      <div>
        <RouterLink to="/modules" class="text-sm text-slate-400 hover:text-white flex items-center gap-1 mb-4">
          ‹ Back to modules
        </RouterLink>
        <span class="text-xs font-bold text-aviation-400 bg-aviation-900/30 px-2 py-0.5 rounded-lg">{{ module.code }}</span>
        <h1 class="text-2xl font-bold text-white mt-2">{{ module.title }}</h1>
        <div class="flex gap-2 mt-2">
          <span v-for="lt in module.licence_types" :key="lt"
            class="text-xs text-slate-400 border border-slate-600 px-2 py-0.5 rounded">{{ lt }}</span>
        </div>
      </div>

      <div class="space-y-2">
        <RouterLink v-for="s in module.subjects" :key="s.id" :to="`/subjects/${s.id}`"
          class="flex items-center justify-between p-4 bg-navy-800 border border-slate-700/50 rounded-xl
                 hover:border-aviation-500/50 hover:bg-navy-700 transition-all group">
          <div class="flex items-center gap-3">
            <span class="text-xs font-mono text-slate-400">{{ s.code }}</span>
            <span class="text-sm font-medium text-white group-hover:text-aviation-300 transition-colors">{{ s.title }}</span>
          </div>
          <span class="text-slate-500 group-hover:text-aviation-400 transition-colors">›</span>
        </RouterLink>
      </div>
    </template>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { RouterLink, useRoute } from 'vue-router'
import { api } from '@/lib/api'
import Spinner from '@/components/Spinner.vue'

const route = useRoute()
const loading = ref(true)
const module = ref<{ id: number; code: string; title: string; licence_types: string[]; subjects: { id: number; code: string; title: string }[] } | null>(null)

onMounted(async () => {
  const res = await api.get(`/api/v1/content/modules/${route.params.id}`)
  module.value = res.data
  loading.value = false
})
</script>
