<template>
  <div class="bg-white border border-slate-200 rounded-2xl p-5 sm:p-6 space-y-5">
    <div class="flex items-center justify-between">
      <h2 class="font-semibold text-slate-900">{{ title }}</h2>
      <div v-if="summary.count" class="flex items-center gap-2">
        <StarRating :model-value="Math.round(summary.average)" readonly size="sm" />
        <span class="text-sm text-slate-500">{{ summary.average.toFixed(1) }} ({{ summary.count }})</span>
      </div>
    </div>

    <!-- Write / edit a review -->
    <div v-if="authStore.isAuthenticated" class="border border-slate-100 rounded-xl p-4 bg-slate-50 space-y-3">
      <p class="text-sm font-medium text-slate-700">{{ myReview ? 'Your review' : 'Leave a review' }}</p>
      <StarRating v-model="form.rating" />
      <textarea v-model="form.comment" rows="2" placeholder="Optional comment…"
        class="w-full bg-white border border-slate-300 rounded-xl px-3 py-2 text-sm text-slate-900
               focus:outline-none focus:ring-2 focus:ring-aviation-500 resize-none" />
      <div class="flex items-center gap-3">
        <button type="button" :disabled="!form.rating || submitting" @click="submit"
          class="bg-aviation-500 hover:bg-aviation-600 disabled:opacity-50 text-white text-sm font-medium
                 px-4 py-2 rounded-xl transition-colors">
          {{ submitting ? 'Saving…' : (myReview ? 'Update review' : 'Submit review') }}
        </button>
        <span v-if="saved" class="text-xs text-emerald-600">Saved!</span>
      </div>
    </div>
    <RouterLink v-else to="/login"
      class="block text-sm text-aviation-600 hover:text-aviation-700 font-medium">
      Log in to leave a review
    </RouterLink>

    <!-- Existing reviews -->
    <div v-if="summary.reviews.length" class="space-y-3 pt-1">
      <div v-for="r in summary.reviews" :key="r.id" class="border-t border-slate-100 pt-3 first:border-t-0 first:pt-0">
        <div class="flex items-center justify-between">
          <span class="text-sm font-medium text-slate-800">{{ r.user_name }}</span>
          <StarRating :model-value="r.rating" readonly size="sm" />
        </div>
        <p v-if="r.comment" class="text-sm text-slate-500 mt-1">{{ r.comment }}</p>
      </div>
    </div>
    <p v-else class="text-sm text-slate-400">No reviews yet — be the first!</p>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, onMounted } from 'vue'
import { RouterLink } from 'vue-router'
import { api } from '@/lib/api'
import { useAuthStore } from '@/stores/auth'
import StarRating from '@/components/StarRating.vue'

const props = defineProps<{
  moduleId?: number
  title: string
}>()

interface Review { id: number; user_name: string; module_id: number | null; rating: number; comment: string | null; created_at: string }

const authStore = useAuthStore()
const summary = reactive<{ reviews: Review[]; average: number; count: number }>({ reviews: [], average: 0, count: 0 })
const myReview = ref<Review | null>(null)
const form = reactive({ rating: 0, comment: '' })
const submitting = ref(false)
const saved = ref(false)

const query = props.moduleId ? `?module_id=${props.moduleId}` : ''

async function load() {
  const res = await api.get(`/api/v1/content/reviews${query}`)
  summary.reviews = res.data.reviews
  summary.average = res.data.average
  summary.count = res.data.count

  if (authStore.isAuthenticated) {
    const mine = await api.get(`/api/v1/content/reviews/me${query}`)
    if (mine.data) {
      myReview.value = mine.data
      form.rating = mine.data.rating
      form.comment = mine.data.comment || ''
    }
  }
}

async function submit() {
  submitting.value = true
  saved.value = false
  try {
    const body: Record<string, unknown> = { rating: form.rating, comment: form.comment }
    if (props.moduleId) body.module_id = props.moduleId
    await api.post('/api/v1/content/reviews', body)
    saved.value = true
    await load()
  } finally {
    submitting.value = false
  }
}

onMounted(load)
</script>
