<template>
  <div class="min-h-full">
    <div v-if="loading" class="flex justify-center py-20"><Spinner /></div>

    <template v-else-if="subject">
      <!-- ── Sticky top bar ── -->
      <div class="sticky top-0 z-20 bg-white/90 backdrop-blur border-b border-slate-200 px-4 py-3 flex items-center gap-3">
        <RouterLink :to="`/modules/${subject.module_id}`"
          class="flex items-center gap-1.5 text-sm text-slate-500 hover:text-aviation-600 transition-colors shrink-0">
          <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"/>
          </svg>
          Back
        </RouterLink>
        <div class="flex-1 flex items-center gap-2 min-w-0">
          <span class="text-xs font-mono text-aviation-700 bg-aviation-50 px-2 py-0.5 rounded shrink-0">{{ subject.code }}</span>
          <span class="text-sm font-medium text-slate-900 truncate">{{ subject.title }}</span>
        </div>
        <RouterLink :to="{ name: 'ai', query: { subject: subject.title } }"
          class="flex items-center gap-1.5 shrink-0 bg-aviation-500 hover:bg-aviation-600 text-white text-xs font-medium px-3 py-1.5 rounded-lg transition-colors">
          <svg class="w-3.5 h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
              d="M9.663 17h4.673M12 3v1m6.364 1.636l-.707.707M21 12h-1M4 12H3m3.343-5.657l-.707-.707m2.828 9.9a5 5 0 117.072 0l-.548.547A3.374 3.374 0 0014 18.469V19a2 2 0 11-4 0v-.531c0-.895-.356-1.754-.988-2.386l-.548-.547z"/>
          </svg>
          Ask AI
        </RouterLink>
      </div>

      <!-- ── Main layout ── -->
      <div class="max-w-5xl mx-auto px-4 py-6 sm:py-8 flex gap-8">

        <!-- Table of contents (desktop) -->
        <aside v-if="toc.length > 0"
          class="hidden xl:block w-52 shrink-0">
          <div class="sticky top-20">
            <p class="text-xs font-semibold text-slate-400 uppercase tracking-wider mb-3">Contents</p>
            <nav class="space-y-1">
              <a v-for="item in toc" :key="item.id"
                :href="`#${item.id}`"
                :class="[
                  'block text-xs leading-snug py-1 px-2 rounded transition-colors',
                  item.level === 1
                    ? 'font-semibold text-slate-600 hover:text-aviation-600'
                    : 'text-slate-400 hover:text-slate-600 pl-4'
                ]">
                {{ item.text }}
              </a>
            </nav>
          </div>
        </aside>

        <!-- Content column -->
        <div class="flex-1 min-w-0 space-y-8">

          <!-- Page title -->
          <div>
            <div class="h-1 w-16 rounded-full bg-gradient-to-r from-aviation-500 to-aviation-400 mb-4" />
            <h1 class="text-2xl sm:text-3xl font-bold text-slate-900">{{ subject.title }}</h1>
            <p class="text-slate-500 text-sm mt-1">EASA Part-66 — {{ subject.code }}</p>
          </div>

          <!-- Theory content -->
          <div v-if="subject.content">
            <!-- Section cards -->
            <div v-if="sections.length > 0" class="space-y-6">
              <div v-for="section in sections" :key="section.id"
                class="bg-white border border-slate-200 rounded-2xl overflow-hidden hover:border-slate-300 transition-colors">

                <!-- Section header -->
                <div v-if="section.title"
                  class="flex items-center gap-3 px-4 sm:px-6 pt-5 pb-3 border-b border-slate-100">
                  <div class="w-1.5 h-6 rounded-full bg-aviation-500 shrink-0" />
                  <h2 :id="section.id" class="text-base font-semibold text-aviation-700 scroll-mt-20">
                    {{ section.title }}
                  </h2>
                </div>

                <!-- Section body -->
                <div class="px-4 sm:px-6 py-5
                  prose prose-sm max-w-none overflow-x-auto
                  prose-headings:text-aviation-800 prose-headings:font-semibold
                  prose-h2:text-base prose-h2:mt-0 prose-h3:text-sm
                  prose-strong:text-slate-900
                  prose-table:text-sm
                  prose-th:text-aviation-700 prose-th:font-semibold prose-th:bg-aviation-50 prose-th:py-2 prose-th:px-3
                  prose-td:border-slate-200 prose-td:py-2 prose-td:px-3 prose-th:border-slate-200
                  prose-code:text-aviation-700 prose-code:bg-aviation-50 prose-code:px-1.5 prose-code:py-0.5 prose-code:rounded prose-code:text-xs prose-code:before:content-none prose-code:after:content-none
                  prose-li:text-slate-600 prose-p:text-slate-600 prose-p:leading-relaxed
                  prose-a:text-aviation-600 hover:prose-a:text-aviation-700
                  prose-blockquote:border-aviation-400 prose-blockquote:text-slate-500
                  [&_svg]:inline-block [&_svg]:max-w-full [&_table]:w-full [&_table]:border-collapse
                  [&_tr:nth-child(even)]:bg-slate-50"
                  v-html="section.html" />
              </div>
            </div>

            <!-- Fallback: render entire content as one block if parsing fails -->
            <div v-else
              class="bg-white border border-slate-200 rounded-2xl px-4 sm:px-6 py-6
                prose prose-sm max-w-none overflow-x-auto
                prose-headings:text-aviation-700 prose-headings:font-semibold
                prose-strong:text-slate-900
                prose-table:text-sm prose-th:text-aviation-700 prose-th:bg-aviation-50
                prose-td:border-slate-200 prose-th:border-slate-200
                prose-code:text-aviation-700 prose-code:bg-aviation-50 prose-code:px-1 prose-code:rounded prose-code:before:content-none prose-code:after:content-none
                prose-li:text-slate-600 prose-p:text-slate-600
                prose-a:text-aviation-600 hover:prose-a:text-aviation-700
                [&_svg]:inline-block [&_svg]:max-w-full"
              v-html="renderedContent" />
          </div>

          <!-- Empty state -->
          <div v-else class="bg-white rounded-2xl p-10 border border-slate-200 text-center">
            <svg class="w-12 h-12 text-slate-300 mx-auto mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5"
                d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"/>
            </svg>
            <p class="text-slate-500 font-medium">Theory content coming soon</p>
            <p class="text-slate-400 text-sm mt-1">Use the AI Instructor to learn this topic in the meantime.</p>
          </div>

          <!-- AI banner -->
          <div class="bg-gradient-to-r from-aviation-50 to-aviation-50/40 border border-aviation-200 rounded-2xl p-5 sm:p-6 flex flex-col sm:flex-row items-start sm:items-center justify-between gap-4">
            <div class="flex items-start gap-3">
              <div class="w-9 h-9 rounded-xl bg-aviation-100 flex items-center justify-center shrink-0 mt-0.5">
                <svg class="w-5 h-5 text-aviation-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                    d="M9.663 17h4.673M12 3v1m6.364 1.636l-.707.707M21 12h-1M4 12H3m3.343-5.657l-.707-.707m2.828 9.9a5 5 0 117.072 0l-.548.547A3.374 3.374 0 0014 18.469V19a2 2 0 11-4 0v-.531c0-.895-.356-1.754-.988-2.386l-.548-.547z"/>
                </svg>
              </div>
              <div>
                <p class="font-semibold text-slate-900">Study with the AI Instructor</p>
                <p class="text-sm text-slate-500 mt-0.5">Get explanations, worked examples, or a simulated oral exam on <span class="text-aviation-700">{{ subject.title }}</span>.</p>
              </div>
            </div>
            <RouterLink :to="{ name: 'ai', query: { subject: subject.title } }"
              class="flex-shrink-0 bg-aviation-500 hover:bg-aviation-600 text-white text-sm font-semibold px-5 py-2.5 rounded-xl transition-colors whitespace-nowrap">
              Open AI Chat →
            </RouterLink>
          </div>

        </div>
      </div>
    </template>

    <div v-else class="text-center py-20 text-slate-400">Subject not found.</div>
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

interface TocItem {
  id: string
  text: string
  level: number
}

interface Section {
  id: string
  title: string
  html: string
}

const route = useRoute()
const loading = ref(true)
const subject = ref<Subject | null>(null)

onMounted(async () => {
  const res = await api.get(`/api/v1/content/subjects/${route.params.id}`)
  subject.value = res.data
  loading.value = false
})

// Full rendered content (fallback)
const renderedContent = computed(() =>
  subject.value?.content ? marked.parse(subject.value.content) as string : ''
)

// Slug helper
function slugify(text: string): string {
  return text.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)/g, '')
}

// Parse content into top-level ## sections
const sections = computed((): Section[] => {
  const content = subject.value?.content
  if (!content) return []

  // Strip leading H1 (the subject title) — split on ## headings
  const lines = content.split('\n')
  const result: Section[] = []
  let currentTitle = ''
  let currentLines: string[] = []
  let seenFirstH1 = false

  for (const line of lines) {
    const h1Match = line.match(/^# (.+)$/)
    const h2Match = line.match(/^## (.+)$/)

    if (h1Match && !seenFirstH1) {
      seenFirstH1 = true
      continue // skip the top-level title (already shown as page header)
    }

    if (h2Match) {
      if (currentLines.length > 0 || currentTitle) {
        result.push({
          id: slugify(currentTitle || 'intro'),
          title: currentTitle,
          html: marked.parse(currentLines.join('\n')) as string,
        })
      }
      currentTitle = h2Match[1]
      currentLines = []
    } else {
      currentLines.push(line)
    }
  }

  // Last section
  if (currentLines.length > 0 || currentTitle) {
    result.push({
      id: slugify(currentTitle || 'content'),
      title: currentTitle,
      html: marked.parse(currentLines.join('\n')) as string,
    })
  }

  return result.filter(s => s.html.trim() || s.title)
})

// Table of contents from sections
const toc = computed((): TocItem[] =>
  sections.value
    .filter(s => s.title)
    .map(s => ({ id: s.id, text: s.title, level: 1 }))
)
</script>
