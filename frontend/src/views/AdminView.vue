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

    <div class="flex gap-1 border-b border-slate-200">
      <button v-for="t in ['users', 'transactions']" :key="t" @click="tab = t as typeof tab"
        class="px-4 py-2.5 text-sm font-medium border-b-2 -mb-px transition-colors capitalize"
        :class="tab === t ? 'border-aviation-500 text-aviation-700' : 'border-transparent text-slate-500 hover:text-slate-700'">
        {{ t }}
      </button>
    </div>

    <input v-if="tab === 'users'" v-model="search" type="text" placeholder="Search by name or email…"
      class="w-full sm:max-w-sm bg-white border border-slate-300 rounded-xl px-4 py-2.5 text-sm text-slate-900
             focus:outline-none focus:ring-2 focus:ring-aviation-500 focus:border-transparent" />

    <div v-if="tab === 'users' && loading" class="flex justify-center py-12">
      <Spinner />
    </div>

    <div v-else-if="tab === 'users'" class="bg-white border border-slate-200 rounded-2xl overflow-hidden">
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
                  class="bg-white border border-slate-300 rounded-lg pl-2 pr-7 py-1 text-sm text-slate-900 w-24">
                  <option value="B1.1">B1.1</option>
                  <option value="B1.3">B1.3</option>
                  <option value="B2">B2</option>
                  <option value="all">all</option>
                </select>
                <span v-else class="text-slate-700">{{ u.licence_type }}</span>
              </td>
              <td class="px-4 py-3">
                <select v-if="editingId === u.id" v-model="editForm.planCode"
                  class="bg-white border border-slate-300 rounded-lg pl-2 pr-7 py-1 text-sm text-slate-900 w-40">
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

    <!-- Transactions tab -->
    <template v-else>
      <div class="flex flex-col sm:flex-row sm:items-end gap-3 sm:justify-between">
        <div class="flex gap-3">
          <div>
            <label class="block text-xs text-slate-400 uppercase tracking-wide mb-1">From</label>
            <input v-model="txFrom" type="date"
              class="bg-white border border-slate-300 rounded-xl px-3 py-2 text-sm text-slate-900
                     focus:outline-none focus:ring-2 focus:ring-aviation-500" />
          </div>
          <div>
            <label class="block text-xs text-slate-400 uppercase tracking-wide mb-1">To</label>
            <input v-model="txTo" type="date"
              class="bg-white border border-slate-300 rounded-xl px-3 py-2 text-sm text-slate-900
                     focus:outline-none focus:ring-2 focus:ring-aviation-500" />
          </div>
        </div>
        <button @click="exportCsv" :disabled="!transactions.length"
          class="bg-aviation-500 hover:bg-aviation-600 disabled:opacity-40 text-white text-sm font-medium
                 px-4 py-2.5 rounded-xl transition-colors self-start">
          Export CSV
        </button>
      </div>

      <div v-if="txLoading" class="flex justify-center py-12"><Spinner /></div>

      <div v-else class="bg-white border border-slate-200 rounded-2xl overflow-hidden">
        <div class="overflow-x-auto">
          <table class="w-full text-sm">
            <thead>
              <tr class="border-b border-slate-200 text-left text-xs text-slate-400 uppercase tracking-wide">
                <th class="px-4 py-3 font-medium">Date</th>
                <th class="px-4 py-3 font-medium">Customer</th>
                <th class="px-4 py-3 font-medium">Description</th>
                <th class="px-4 py-3 font-medium text-right">Amount</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="t in transactions" :key="t.id" class="border-b border-slate-100 last:border-0">
                <td class="px-4 py-3 text-slate-500 text-xs whitespace-nowrap">{{ formatDateTime(t.created_at) }}</td>
                <td class="px-4 py-3">
                  <p class="font-medium text-slate-900">{{ t.user_name }}</p>
                  <p class="text-slate-400 text-xs">{{ t.user_email }}</p>
                </td>
                <td class="px-4 py-3 text-slate-700">{{ t.description }}</td>
                <td class="px-4 py-3 text-right font-medium text-slate-900 whitespace-nowrap">
                  {{ formatAmount(t.amount_cents, t.currency) }}
                </td>
              </tr>
            </tbody>
            <tfoot v-if="transactions.length">
              <tr class="border-t-2 border-slate-200">
                <td colspan="3" class="px-4 py-3 text-right text-xs font-semibold text-slate-500 uppercase tracking-wide">Total</td>
                <td class="px-4 py-3 text-right font-bold text-slate-900">{{ totalFormatted }}</td>
              </tr>
            </tfoot>
          </table>
        </div>
        <p v-if="!txLoading && !transactions.length" class="text-center text-slate-400 text-sm py-10">No transactions in this period.</p>
      </div>
    </template>

    <!-- Delete confirmation modal -->
    <Transition name="fade">
      <div v-if="deleteTarget" class="fixed inset-0 z-50 flex items-center justify-center p-4">
        <div class="absolute inset-0 bg-slate-900/40" @click="deleteTarget = null" />
        <div class="relative bg-white rounded-2xl shadow-xl w-full max-w-sm p-6">
          <h3 class="text-base font-semibold text-slate-900 mb-2">Delete this account?</h3>
          <p class="text-sm text-slate-500 mb-6">
            <span class="font-medium text-slate-700">{{ deleteTarget.full_name }}</span>
            ({{ deleteTarget.email }}) will be permanently removed, along with their progress and history. This can't be undone.
          </p>
          <div class="flex justify-end gap-3">
            <button @click="deleteTarget = null"
              class="text-sm font-medium text-slate-500 hover:text-slate-700 px-4 py-2 rounded-xl">
              Cancel
            </button>
            <button @click="performDelete" :disabled="deleting"
              class="text-sm font-medium bg-red-500 hover:bg-red-600 disabled:opacity-50 text-white px-4 py-2 rounded-xl transition-colors">
              {{ deleting ? 'Deleting…' : 'Delete account' }}
            </button>
          </div>
        </div>
      </div>
    </Transition>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, computed, onMounted, watch } from 'vue'
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

interface Transaction {
  id: number
  user_email: string
  user_name: string
  plan_name: string | null
  amount_cents: number
  currency: string
  description: string
  created_at: string
}

const tab = ref<'users' | 'transactions'>('users')

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

const deleteTarget = ref<AdminUser | null>(null)
const deleting = ref(false)

function confirmDelete(u: AdminUser) {
  deleteTarget.value = u
  error.value = ''
}

async function performDelete() {
  if (!deleteTarget.value) return
  deleting.value = true
  error.value = ''
  try {
    await api.delete(`/api/v1/auth/admin/users/${deleteTarget.value.id}`)
    flashNotice(`Deleted ${deleteTarget.value.full_name}.`)
    deleteTarget.value = null
    await load()
  } catch (e: unknown) {
    error.value = (e as { response?: { data?: { error?: string } } })?.response?.data?.error ?? 'Could not delete user.'
  } finally {
    deleting.value = false
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

// Transactions tab — for the monthly myDATA export handed to the accountant.
function monthStart(): string {
  const d = new Date()
  return new Date(d.getFullYear(), d.getMonth(), 1).toISOString().slice(0, 10)
}
function today(): string {
  return new Date().toISOString().slice(0, 10)
}

const transactions = ref<Transaction[]>([])
const txLoading = ref(false)
const txFrom = ref(monthStart())
const txTo = ref(today())

async function loadTransactions() {
  txLoading.value = true
  try {
    const params: Record<string, string> = {}
    if (txFrom.value) params.from = txFrom.value
    if (txTo.value) params.to = `${txTo.value}T23:59:59Z`
    const res = await api.get('/api/v1/auth/admin/transactions', { params })
    transactions.value = res.data
  } finally {
    txLoading.value = false
  }
}

watch(tab, (t) => { if (t === 'transactions' && !transactions.value.length) loadTransactions() })
watch([txFrom, txTo], () => { if (tab.value === 'transactions') loadTransactions() })

function formatDateTime(iso: string) {
  return new Date(iso).toLocaleString('en-GB', { year: 'numeric', month: 'short', day: 'numeric', hour: '2-digit', minute: '2-digit' })
}

function formatAmount(cents: number, currency: string) {
  return new Intl.NumberFormat('en-IE', { style: 'currency', currency }).format(cents / 100)
}

const totalFormatted = computed(() => {
  if (!transactions.value.length) return ''
  const currency = transactions.value[0].currency
  const total = transactions.value.reduce((sum, t) => sum + t.amount_cents, 0)
  return formatAmount(total, currency)
})

function exportCsv() {
  const header = ['Date', 'Customer name', 'Customer email', 'Description', 'Amount', 'Currency']
  const rows = transactions.value.map(t => [
    new Date(t.created_at).toISOString(),
    t.user_name,
    t.user_email,
    t.description,
    (t.amount_cents / 100).toFixed(2),
    t.currency.toUpperCase(),
  ])
  const csv = [header, ...rows]
    .map(row => row.map(cell => `"${String(cell).replace(/"/g, '""')}"`).join(','))
    .join('\n')
  const blob = new Blob([csv], { type: 'text/csv;charset=utf-8;' })
  const url = URL.createObjectURL(blob)
  const a = document.createElement('a')
  a.href = url
  a.download = `vjet-academy-transactions_${txFrom.value}_${txTo.value}.csv`
  a.click()
  URL.revokeObjectURL(url)
}
</script>

<style>
.fade-enter-active, .fade-leave-active { transition: opacity 0.15s ease; }
.fade-enter-from, .fade-leave-to { opacity: 0; }
</style>
