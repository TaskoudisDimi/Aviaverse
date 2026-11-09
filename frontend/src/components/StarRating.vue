<template>
  <div class="flex items-center gap-0.5" :class="readonly ? '' : 'cursor-pointer'">
    <svg v-for="n in 5" :key="n" viewBox="0 0 20 20"
      :class="[sizeClass, n <= displayValue ? 'text-amber-400' : 'text-slate-300']"
      fill="currentColor"
      @mouseenter="!readonly && (hovered = n)"
      @mouseleave="!readonly && (hovered = 0)"
      @click="!readonly && $emit('update:modelValue', n)">
      <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.286 3.957a1 1 0 00.95.69h4.162c.969 0 1.371 1.24.588 1.81l-3.368 2.447a1 1 0 00-.363 1.118l1.287 3.957c.3.921-.755 1.688-1.538 1.118l-3.368-2.447a1 1 0 00-1.175 0l-3.368 2.447c-.783.57-1.838-.197-1.538-1.118l1.287-3.957a1 1 0 00-.363-1.118L2.063 9.384c-.783-.57-.38-1.81.588-1.81h4.162a1 1 0 00.95-.69l1.286-3.957z" />
    </svg>
  </div>
</template>

<script setup lang="ts">
import { ref, computed } from 'vue'

const props = withDefaults(defineProps<{
  modelValue: number
  readonly?: boolean
  size?: 'sm' | 'md'
}>(), {
  readonly: false,
  size: 'md',
})

defineEmits<{ 'update:modelValue': [value: number] }>()

const hovered = ref(0)
const displayValue = computed(() => hovered.value || props.modelValue)
const sizeClass = computed(() => (props.size === 'sm' ? 'w-4 h-4' : 'w-6 h-6'))
</script>
