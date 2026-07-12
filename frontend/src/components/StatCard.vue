<template>
  <div class="bg-navy-800 rounded-2xl p-5 border border-slate-700/50">
    <p class="text-xs font-medium text-slate-400 uppercase tracking-wider">{{ label }}</p>
    <div class="mt-2 flex items-end gap-1">
      <span class="text-3xl font-bold" :class="textColor">{{ value }}</span>
      <span class="text-sm text-slate-400 mb-0.5">{{ unit }}</span>
    </div>
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue'

const props = defineProps<{
  label: string
  value: string
  unit: string
  color: 'blue' | 'purple' | 'green' | 'orange'
}>()

const textColor = computed(() => ({
  blue:   'text-aviation-400',
  purple: 'text-purple-400',
  green:  'text-green-400',
  orange: 'text-orange-400',
}[props.color]))
</script>
