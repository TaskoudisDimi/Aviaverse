<template>
  <div class="p-4 sm:p-6 max-w-6xl mx-auto space-y-6">
    <div>
      <h1 class="text-2xl font-bold text-slate-900">Admin</h1>
      <p class="text-slate-500 text-sm mt-1">{{ users.length }} accounts</p>
    </div>

    <div v-if="notice" class="bg-green-50 border border-green-200 rounded-lg px-4 py-3 text-green-700 text-sm">
      {{ notice }}
    </div>
    <div v-if="error" class="bg-red-50 border border-red-200 rounded-lg px-4 py-3 text-red-600 text-sm">
      {{ error }}
    </div>

    <input v-model="search" type="text" placeholder="Search by name or email…"
      class="w-full sm:max-w-sm bg-white border border-slate-300 rounded-xl px-4 py-2.5 text-sm text-slate-900
             focus:outline-none focus:ring-2 focus:ring-aviation-500 focus:border-transparent" />

    <div v-if="loading" class="flex justify-center py-12">
      <Spinner />
    </div>

    <div v-else class="bg-white border border-slate-200 rounded-2xl overflow-hidden">
      <div class="overflow-x-auto">
        <table class="w-full text-sm">
          <thead>
            <tr class="border-b border-slate-200 text-left text-xs text-slate-400 uppercase tracking-wide">
              <th class="px-4 py-3 font-medium">User</th>
              <th class="px-4 py-3 font-medium">Licence</th>
              <th class="px-4 py-3 font-medium">Plan</th>
              <th class="px-4 py-3 font-medium">Admin</th>
              <th class="px-4 py-3 font-medium">Joined</th>
              <th class="px-4 py-3 font-medium text-right">Actions</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="u in filteredUsers" :key="u.id" class="border-b border-slate-100 last:border-0 align-top">
              <td class="px-4 py-3">
                <p class="font-medium text-slate-900">{{ u.full_name }}</p>
                <p class="text-slate-400 text-xs">{{ u.email }}</p>
              </td>
              <td class="px-4 py-3">
                <select v-if="editingId === u.id" v-model="editForm.licenceType"
                  class="bg-white border border-slate-300 rounded-lg px-2 py-1 text-sm">
                  <option value="B1.1">B1.1</option>
                  <option value="B1.3">B1.3</option>
                  <option value="B2">B2</option>
                  <option value="all">all</option>
                </select>
                <span v-else class="text-slate-700">{{ u.licence_type }}</span>
              </td>
              <td class="px-4 py-3">
                <select v-if="editingId === u.id" v-model="editForm.planCode"
                  class="bg-white border border-slate-300 rounded-lg px-2 py-1 text-sm">
                  <option v-for="p in allPlans" :key="p.code" :value="p.code">{{ p.name }}</option>
                </select>
                <span v-else class="text-slate-700">{{ u.plan_name ?? '—' }}</span>
              </td>
              <td class="px-4 py-3">
                <input v-if="editingId === u.id" type="checkbox" v-model="editForm.isAdmin" class="w-4 h-4" />
                <span v-else-if="u.is_admin" class="inline-flex items-center px-2 py-0.5 rounded-full text-xs font-medium bg-aviation-50 text-aviation-700 border border-aviation-200">Admin</span>
                <span v-else class="text-slate-300">—</span>
              </td>
              <td class="px-4 py-3 text-slate-500 text-xs whitespace-nowrap">{{ formatDate(u.created_at) }}</td>
              <td class="px-4 py-3 text-right whitespace-nowrap">
                <template v-if="editingId === u.id">
                  <button @click="save(u)" :disabled="saving" class="text-aviation-600 hover:text-aviation-700 font-medium text-xs mr-3 disabled:opacity-50">
                    {{ saving ? 'Saving…' : 'Save' }}
                  </button>
                  <button @click="editingId = null" class="text-slate-400 hover:text-slate-600 text-xs">Cancel</button>
                </template>
                <template v-else>
                  <button @click="startEdit(u)" class="text-aviation-600 hover:text-aviation-700 font-medium text-xs mr-3">Edit</button>
                  <button @click="confirmDelete(u)" class="text-red-500 hover:text-red-600 text-xs">Delete</button>
                </template>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <p v-if="!loading && !filteredUsers.length" class="text-center text-slate-400 text-sm py-10">No matching users.</p>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, computed, onMounted } from 'vue'
import { api } from '@/lib/api'
import Spinner from '@/components/Spinner.vue'

interface AdminUser {
  id: string
  email: string
  full_name: string
  licence_type: string
  is_admin: boolean
  created_at: string
  plan_code: string | null
  plan_name: string | null
  plan_expires_at: string | null
}

interface PlanListItem {
  code: string
  name: string
}

const users = ref<AdminUser[]>([])
const allPlans = ref<PlanListItem[]>([])
const loading = ref(true)
const search = ref('')
const notice = ref('')
const error = ref('')

const editingId = ref<string | null>(null)
const editForm = reactive({ licenceType: '', planCode: '', isAdmin: false })
const saving = ref(false)

const filteredUsers = computed(() => {
  const q = search.value.trim().toLowerCase()
  if (!q) return users.value
  return users.value.filter(u => u.full_name.toLowerCase().includes(q) || u.email.toLowerCase().includes(q))
})

function flashNotice(msg: string) {
  notice.value = msg
  setTimeout(() => { if (notice.value === msg) notice.value = '' }, 4000)
}

function startEdit(u: AdminUser) {
  editingId.value = u.id
  editForm.licenceType = u.licence_type
  editForm.planCode = u.plan_code ?? allPlans.value[0]?.code ?? ''
  editForm.isAdmin = u.is_admin
  error.value = ''
}

async function save(u: AdminUser) {
  saving.value = true
  error.value = ''
  try {
    await api.patch(`/api/v1/auth/admin/users/${u.id}`, {
      full_name: u.full_name,
      licence_type: editForm.licenceType,
      is_admin: editForm.isAdmin,
    })
    if (editForm.planCode && editForm.planCode !== u.plan_code) {
      await api.post(`/api/v1/auth/admin/users/${u.id}/plan`, { plan_code: editForm.planCode })
    }
    editingId.value = null
    flashNotice(`Updated ${u.full_name}.`)
    await load()
  } catch (e: unknown) {
    error.value = (e as { response?: { data?: { error?: string } } })?.response?.data?.error ?? 'Could not save changes.'
  } finally {
    saving.value = false
  }
}

async function confirmDelete(u: AdminUser) {
  if (!window.confirm(`Delete ${u.full_name} (${u.email})? This can't be undone.`)) return
  error.value = ''
  try {
    await api.delete(`/api/v1/auth/admin/users/${u.id}`)
    flashNotice(`Deleted ${u.full_name}.`)
    await load()
  } catch (e: unknown) {
    error.value = (e as { response?: { data?: { error?: string } } })?.response?.data?.error ?? 'Could not delete user.'
  }
}

function formatDate(iso: string) {
  return new Date(iso).toLocaleDateString('en-GB', { year: 'numeric', month: 'short', day: 'numeric' })
}

async function load() {
  loading.value = true
  try {
    const [usersRes, plansRes] = await Promise.all([
      api.get('/api/v1/auth/admin/users'),
      api.get('/api/v1/auth/plans'),
    ])
    users.value = usersRes.data
    allPlans.value = plansRes.data
  } finally {
    loading.value = false
  }
}

onMounted(load)
</script>
