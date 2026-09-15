<template>
  <div class="bg-white rounded-2xl p-5 border border-slate-200">
    <div class="flex items-start justify-between gap-2">
      <div class="min-w-0">
        <p class="text-xs font-medium text-slate-500 uppercase tracking-wider">{{ label }}</p>
        <div class="mt-2 flex items-end gap-1">
          <span class="text-3xl font-bold text-slate-900">{{ value }}</span>
          <span class="text-sm text-slate-500 mb-0.5">{{ unit }}</span>
        </div>
      </div>
      <div class="w-9 h-9 rounded-xl flex items-center justify-center flex-shrink-0" :class="iconBg">
        <component :is="icon" class="w-5 h-5" :class="textColor" />
      </div>
    </div>

    <div class="mt-3 flex items-end gap-2">
      <svg viewBox="0 0 60 20" class="w-16 h-5 flex-shrink-0" preserveAspectRatio="none">
        <polyline :points="sparklinePoints" fill="none" :stroke="strokeColor" stroke-width="2"
          stroke-linecap="round" stroke-linejoin="round" />
      </svg>
      <span v-if="trend !== undefined" class="text-xs font-medium" :class="trend >= 0 ? 'text-green-600' : 'text-red-500'">
        {{ trend >= 0 ? '↑' : '↓' }} {{ Math.abs(trend) }}% from last week
      </span>
    </div>
  </div>
</template>

<script setup lang="ts">
import { computed, h } from 'vue'

const props = defineProps<{
  label: string
  value: string
  unit: string
  color: 'blue' | 'purple' | 'green' | 'orange'
  trend?: number
}>()

const textColor = computed(() => ({
  blue:   'text-aviation-600',
  purple: 'text-purple-600',
  green:  'text-green-600',
  orange: 'text-orange-500',
}[props.color]))

const iconBg = computed(() => ({
  blue:   'bg-aviation-50',
  purple: 'bg-purple-50',
  green:  'bg-green-50',
  orange: 'bg-orange-50',
}[props.color]))

const strokeColor = computed(() => ({
  blue:   '#3366ff',
  purple: '#a855f7',
  green:  '#16a34a',
  orange: '#f97316',
}[props.color]))

// A simple upward/downward trend line shape driven only by the trend
// direction — this is decorative (we don't store weekly time series yet),
// not a plot of real historical values.
const sparklinePoints = computed(() => {
  const up = (props.trend ?? 0) >= 0
  const y = up ? [17, 14, 15, 10, 8, 3] : [3, 6, 5, 11, 13, 17]
  return y.map((v, i) => `${i * 12},${v}`).join(' ')
})

const iconPath = (path: string) => ({
  render() {
    return h('svg', { fill: 'none', viewBox: '0 0 24 24', stroke: 'currentColor', 'stroke-width': '1.5' },
      [h('path', { 'stroke-linecap': 'round', 'stroke-linejoin': 'round', d: path })])
  }
})

const ClockIcon = iconPath('M12 6v6h4.5m4.5 0a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z')
const BookIcon = iconPath('M12 6.042A8.967 8.967 0 0 0 6 3.75c-1.052 0-2.062.18-3 .512v14.25A8.987 8.987 0 0 1 6 18c2.305 0 4.408.867 6 2.292m0-14.25a8.966 8.966 0 0 1 6-2.292c1.052 0 2.062.18 3 .512v14.25A8.987 8.987 0 0 0 18 18a8.967 8.967 0 0 0-6 2.292m0-14.25v14.25')
const TargetIcon = iconPath('M12 21a9 9 0 1 0 0-18 9 9 0 0 0 0 18Zm0-4.5a4.5 4.5 0 1 0 0-9 4.5 4.5 0 0 0 0 9Zm0-2.25a2.25 2.25 0 1 0 0-4.5 2.25 2.25 0 0 0 0 4.5Z')
const ShieldIcon = iconPath('M9 12.75 11.25 15 15 9.75m-3-7.036A11.959 11.959 0 0 1 3.598 6 11.99 11.99 0 0 0 3 9.749c0 5.592 3.824 10.29 9 11.623 5.176-1.332 9-6.03 9-11.622 0-1.31-.21-2.571-.598-3.751h-.152c-3.196 0-6.1-1.248-8.25-3.285Z')

const iconMap: Record<string, ReturnType<typeof iconPath>> = { blue: ClockIcon, purple: BookIcon, green: TargetIcon, orange: ShieldIcon }
const icon = computed(() => iconMap[props.color])
</script>
