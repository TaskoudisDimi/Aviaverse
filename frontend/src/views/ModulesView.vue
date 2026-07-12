<template>
  <div class="p-6 max-w-5xl mx-auto space-y-6">
    <div class="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
      <div>
        <h1 class="text-2xl font-bold text-white">Study Modules</h1>
        <p class="text-slate-400 text-sm mt-1">EASA Part-66 curriculum</p>
      </div>
      <select v-model="licenceFilter"
        class="bg-navy-800 border border-slate-600 rounded-xl px-4 py-2 text-sm text-white
               focus:outline-none focus:ring-2 focus:ring-aviation-500">
        <option value="">All licences</option>
        <option value="B1.1">B1.1</option>
        <option value="B1.3">B1.3</option>
        <option value="B2">B2</option>
      </select>
    </div>

    <div v-if="loading" class="flex justify-center py-12"><Spinner /></div>

    <div v-else class="grid sm:grid-cols-2 lg:grid-cols-3 gap-4">
      <RouterLink v-for="m in modules" :key="m.id" :to="`/modules/${m.id}`"
        class="bg-navy-800 border border-slate-700/50 rounded-2xl p-5 hover:border-aviation-500/50
               hover:bg-navy-700 transition-all group">
        <div class="flex items-start justify-between mb-3">
          <span class="text-xs font-bold text-aviation-400 bg-aviation-900/30 px-2 py-0.5 rounded-lg">{{ m.code }}</span>
          <div class="flex gap-1 flex-wrap justify-end">
            <span v-for="lt in m.licence_types" :key="lt"
              class="text-xs text-slate-400 border border-slate-600 px-1.5 py-0.5 rounded">{{ lt }}</span>
          </div>
        </div>
        <h3 class="font-semibold text-white group-hover:text-aviation-300 transition-colors">{{ m.title }}</h3>
        <p class="text-xs text-slate-400 mt-1 line-clamp-2">{{ m.description }}</p>
      </RouterLink>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, watch, onMounted } from 'vue'
import { RouterLink } from 'vue-router'
import { api } from '@/lib/api'
import Spinner from '@/components/Spinner.vue'

interface Module {
  id: number
  code: string
  title: string
  description: string
  licence_types: string[]
  sort_order: number
}

const loading = ref(true)
const modules = ref<Module[]>([])
const licenceFilter = ref('')

async function load() {
  loading.value = true
  const params = licenceFilter.value ? { licence_type: licenceFilter.value } : {}
  const res = await api.get('/api/v1/content/modules', { params })
  modules.value = res.data
  loading.value = false
}

onMounted(load)
watch(licenceFilter, load)
</script>
