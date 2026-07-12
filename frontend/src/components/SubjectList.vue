<template>
  <div class="bg-navy-800 rounded-2xl p-6 border border-slate-700/50">
    <h2 class="font-semibold text-white mb-4">{{ title }}</h2>
    <div v-if="!subjects.length" class="text-slate-500 text-sm">No data yet.</div>
    <ul v-else class="space-y-3">
      <li v-for="s in subjects" :key="s.subject_id" class="flex items-center gap-3">
        <div class="flex-1 min-w-0">
          <p class="text-sm font-medium text-slate-200 truncate">{{ s.subject_code }} – {{ s.subject_title }}</p>
          <div class="mt-1 w-full bg-slate-700 rounded-full h-1.5">
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

const props = defineProps<{
  title: string
  subjects: { subject_id: number; subject_code: string; subject_title: string; module_code: string; percentage: number }[]
  variant: 'weak' | 'strong'
}>()

const barColor = computed(() => props.variant === 'strong' ? 'bg-green-500' : 'bg-red-500')
const textColor = computed(() => props.variant === 'strong' ? 'text-green-400' : 'text-red-400')
</script>
