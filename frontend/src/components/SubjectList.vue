<template>
  <div class="bg-white rounded-2xl p-6 border border-slate-200">
    <div class="flex items-center justify-between mb-4">
      <h2 class="font-semibold text-slate-900">{{ title }}</h2>
      <RouterLink to="/modules" class="text-xs font-medium text-aviation-600 hover:underline">See all →</RouterLink>
    </div>
    <div v-if="!subjects.length" class="text-slate-400 text-sm">No data yet.</div>
    <ul v-else class="space-y-3">
      <li v-for="s in subjects" :key="s.subject_id" class="flex items-center gap-3">
        <div class="flex-1 min-w-0">
          <p class="text-sm font-medium text-slate-700 truncate">{{ s.subject_code }} – {{ s.subject_title }}</p>
          <div class="mt-1 w-full bg-slate-100 rounded-full h-1.5">
            <div class="h-1.5 rounded-full transition-all" :class="barColor"
              :style="{ width: s.percentage + '%' }" />
          </div>
        </div>
        <span class="text-xs font-semibold flex-shrink-0" :class="textColor">{{ s.percentage.toFixed(0) }}%</span>
      </li>
    </ul>
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { RouterLink } from 'vue-router'

const props = defineProps<{
  title: string
  subjects: { subject_id: number; subject_code: string; subject_title: string; module_code: string; percentage: number }[]
  variant: 'weak' | 'strong'
}>()

const barColor = computed(() => props.variant === 'strong' ? 'bg-green-500' : 'bg-orange-400')
const textColor = computed(() => props.variant === 'strong' ? 'text-green-600' : 'text-orange-500')
</script>
