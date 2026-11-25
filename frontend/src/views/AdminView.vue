<template>
  <div class="p-4 sm:p-6 max-w-6xl mx-auto space-y-6">
    <div>
      <h1 class="text-2xl font-bold text-white">Admin</h1>
      <p class="text-slate-300 text-sm mt-1">{{ users.length }} accounts</p>
    </div>

    <div v-if="notice" class="bg-green-50 border border-green-200 rounded-lg px-4 py-3 text-green-700 text-sm">
      {{ notice }}
    </div>
    <div v-if="error" class="bg-red-50 border border-red-200 rounded-lg px-4 py-3 text-red-600 text-sm">
      {{ error }}
    </div>

    <div class="flex gap-1 border-b border-white/15">
      <button v-for="t in ['users', 'transactions', 'organisations']" :key="t" @click="tab = t as typeof tab"
        class="px-4 py-2.5 text-sm font-medium border-b-2 -mb-px transition-colors capitalize"
        :class="tab === t ? 'border-aviation-400 text-aviation-300' : 'border-transparent text-slate-300 hover:text-white'">
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
                <div v-if="editingId === u.id" class="relative w-24">
                  <select v-model="editForm.licenceType"
                    class="appearance-none bg-none bg-white border border-slate-300 rounded-lg pl-2 pr-6 py-1 text-sm text-slate-900 w-full">
                    <option value="B1.1">B1.1</option>
                    <option value="B2">B2</option>
                    <option value="all">all</option>
                  </select>
                  <svg class="pointer-events-none absolute right-1.5 top-1/2 -translate-y-1/2 w-3.5 h-3.5 text-slate-400"
                    fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
                  </svg>
                </div>
                <span v-else class="text-slate-700">{{ u.licence_type }}</span>
              </td>
              <td class="px-4 py-3">
                <div v-if="editingId === u.id" class="relative w-40">
                  <select v-model="editForm.planCode"
                    class="appearance-none bg-none bg-white border border-slate-300 rounded-lg pl-2 pr-6 py-1 text-sm text-slate-900 w-full">
                    <option v-for="p in allPlans" :key="p.code" :value="p.code">{{ p.name }}</option>
                  </select>
                  <svg class="pointer-events-none absolute right-1.5 top-1/2 -translate-y-1/2 w-3.5 h-3.5 text-slate-400"
                    fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
                  </svg>
                </div>
                <span v-else class="text-slate-700">
                  <template v-if="u.custom_module_codes?.length">
                    <span class="inline-flex items-center px-2 py-0.5 rounded-full text-xs font-medium bg-aviation-50 text-aviation-700 border border-aviation-200">
                      Custom access
                    </span>
                    <span class="block text-xs text-slate-400 mt-0.5">{{ u.custom_module_codes.join(', ') }}</span>
                  </template>
                  <template v-else>{{ u.plan_name ?? '—' }}</template>
                </span>
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
                  <button @click="openCustomAccess(u)" class="text-aviation-600 hover:text-aviation-700 font-medium text-xs mr-3">Custom access</button>
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
    <template v-else-if="tab === 'transactions'">
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
                <th class="px-4 py-3 font-medium text-right">Actions</th>
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
                <td class="px-4 py-3 text-right whitespace-nowrap">
                  <button @click="txDeleteTarget = t" class="text-red-500 hover:text-red-600 text-xs font-medium">Delete</button>
                </td>
              </tr>
            </tbody>
            <tfoot v-if="transactions.length">
              <tr class="border-t-2 border-slate-200">
                <td colspan="3" class="px-4 py-3 text-right text-xs font-semibold text-slate-500 uppercase tracking-wide">Total</td>
                <td class="px-4 py-3 text-right font-bold text-slate-900">{{ totalFormatted }}</td>
                <td></td>
              </tr>
            </tfoot>
          </table>
        </div>
        <p v-if="!txLoading && !transactions.length" class="text-center text-slate-400 text-sm py-10">No transactions in this period.</p>
      </div>
    </template>

    <!-- Organisations tab -->
    <template v-else>
      <form @submit.prevent="createOrg" class="bg-white border border-slate-200 rounded-2xl p-4 flex flex-col sm:flex-row gap-3 sm:items-end">
        <div class="flex-1 min-w-[10rem]">
          <label class="block text-xs text-slate-400 uppercase tracking-wide mb-1">School / organisation name</label>
          <input v-model="newOrg.name" required type="text" placeholder="e.g. Hellenic Wings Flight School"
            class="w-full bg-white border border-slate-300 rounded-xl px-3 py-2 text-sm text-slate-900 focus:outline-none focus:ring-2 focus:ring-aviation-500" />
        </div>
        <div class="flex-1 min-w-[10rem]">
          <label class="block text-xs text-slate-400 uppercase tracking-wide mb-1">Contact email</label>
          <input v-model="newOrg.contact_email" type="email" placeholder="contact@school.com"
            class="w-full bg-white border border-slate-300 rounded-xl px-3 py-2 text-sm text-slate-900 focus:outline-none focus:ring-2 focus:ring-aviation-500" />
        </div>
        <div class="w-24">
          <label class="block text-xs text-slate-400 uppercase tracking-wide mb-1">Trial days</label>
          <input v-model.number="newOrg.trial_days" type="number" min="1" placeholder="14"
            class="w-full bg-white border border-slate-300 rounded-xl px-3 py-2 text-sm text-slate-900 focus:outline-none focus:ring-2 focus:ring-aviation-500" />
        </div>
        <button type="submit" :disabled="orgCreating"
          class="bg-aviation-500 hover:bg-aviation-600 disabled:opacity-40 text-white text-sm font-medium px-4 py-2.5 rounded-xl transition-colors">
          {{ orgCreating ? 'Adding…' : 'Add organisation' }}
        </button>
      </form>

      <div v-if="orgsLoading" class="flex justify-center py-12"><Spinner /></div>

      <div v-else class="bg-white border border-slate-200 rounded-2xl overflow-hidden">
        <div class="overflow-x-auto">
          <table class="w-full text-sm">
            <thead>
              <tr class="border-b border-slate-200 text-left text-xs text-slate-400 uppercase tracking-wide">
                <th class="px-4 py-3 font-medium">Organisation</th>
                <th class="px-4 py-3 font-medium">Contact</th>
                <th class="px-4 py-3 font-medium">Trial</th>
                <th class="px-4 py-3 font-medium">Invited</th>
                <th class="px-4 py-3 font-medium">Accepted</th>
                <th class="px-4 py-3 font-medium text-right">Actions</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="o in organisations" :key="o.id" class="border-b border-slate-100 last:border-0 align-top">
                <template v-if="editingOrgId === o.id">
                  <td class="px-4 py-3">
                    <input v-model="orgEditForm.name" type="text"
                      class="w-full bg-white border border-slate-300 rounded-lg px-2 py-1 text-sm text-slate-900" />
                  </td>
                  <td class="px-4 py-3">
                    <input v-model="orgEditForm.contact_name" type="text" placeholder="Contact name"
                      class="w-full bg-white border border-slate-300 rounded-lg px-2 py-1 text-xs text-slate-900 mb-1" />
                    <input v-model="orgEditForm.contact_email" type="email" placeholder="Contact email"
                      class="w-full bg-white border border-slate-300 rounded-lg px-2 py-1 text-xs text-slate-900" />
                  </td>
                  <td class="px-4 py-3">
                    <input v-model.number="orgEditForm.trial_days" type="number" min="1"
                      class="w-20 bg-white border border-slate-300 rounded-lg px-2 py-1 text-sm text-slate-900" />
                  </td>
                  <td class="px-4 py-3 text-slate-700">{{ o.invited_count }}</td>
                  <td class="px-4 py-3 text-slate-700">{{ o.accepted_count }}</td>
                  <td class="px-4 py-3 text-right whitespace-nowrap">
                    <button @click="saveOrgEdit(o)" :disabled="orgEditSaving" class="text-aviation-600 hover:text-aviation-700 font-medium text-xs mr-3 disabled:opacity-50">
                      {{ orgEditSaving ? 'Saving…' : 'Save' }}
                    </button>
                    <button @click="editingOrgId = null" class="text-slate-400 hover:text-slate-600 text-xs">Cancel</button>
                  </td>
                </template>
                <template v-else>
                  <td class="px-4 py-3 font-medium text-slate-900">{{ o.name }}</td>
                  <td class="px-4 py-3 text-slate-500 text-xs">
                    <p v-if="o.contact_name">{{ o.contact_name }}</p>
                    <p>{{ o.contact_email ?? '—' }}</p>
                  </td>
                  <td class="px-4 py-3 text-slate-700">{{ o.trial_days }} days</td>
                  <td class="px-4 py-3 text-slate-700">{{ o.invited_count }}</td>
                  <td class="px-4 py-3 text-slate-700">{{ o.accepted_count }}</td>
                  <td class="px-4 py-3 text-right whitespace-nowrap">
                    <button @click="openOrg(o)" class="text-aviation-600 hover:text-aviation-700 font-medium text-xs mr-3">Manage invites</button>
                    <button @click="startEditOrg(o)" class="text-aviation-600 hover:text-aviation-700 font-medium text-xs mr-3">Edit</button>
                    <button @click="orgDeleteTarget = o" class="text-red-500 hover:text-red-600 text-xs">Delete</button>
                  </td>
                </template>
              </tr>
            </tbody>
          </table>
        </div>
        <p v-if="!orgsLoading && !organisations.length" class="text-center text-slate-400 text-sm py-10">No organisations yet — add one above.</p>
      </div>
    </template>

    <!-- Custom module access modal -->
    <Transition name="fade">
      <div v-if="customAccessTarget" class="fixed inset-0 z-50 flex items-center justify-center p-4">
        <div class="absolute inset-0 bg-slate-900/40" @click="customAccessTarget = null" />
        <div class="relative bg-white rounded-2xl shadow-xl w-full max-w-md p-6 max-h-[85vh] overflow-y-auto">
          <h3 class="text-base font-semibold text-slate-900 mb-1">Custom module access</h3>
          <p class="text-sm text-slate-500 mb-4">
            {{ customAccessTarget.full_name }} ({{ customAccessTarget.email }}) — grants exactly the modules
            checked below, for the given number of days, overriding their current plan's module access.
          </p>

          <div class="grid grid-cols-2 gap-2 mb-4 max-h-56 overflow-y-auto">
            <label v-for="m in allModules" :key="m.code" class="flex items-center gap-2 text-sm text-slate-700">
              <input type="checkbox" v-model="customAccessForm.moduleCodes" :value="m.code" class="w-4 h-4" />
              {{ m.code }} — {{ m.title }}
            </label>
          </div>

          <div class="mb-4">
            <label class="block text-xs text-slate-400 uppercase tracking-wide mb-1">Days of access</label>
            <input v-model.number="customAccessForm.days" type="number" min="1"
              class="w-28 bg-white border border-slate-300 rounded-xl px-3 py-2 text-sm text-slate-900 focus:outline-none focus:ring-2 focus:ring-aviation-500" />
          </div>

          <div class="flex justify-end gap-3">
            <button @click="customAccessTarget = null" class="text-sm font-medium text-slate-500 hover:text-slate-700 px-4 py-2 rounded-xl">Cancel</button>
            <button @click="grantCustomAccess" :disabled="customAccessSaving || !customAccessForm.moduleCodes.length"
              class="bg-aviation-500 hover:bg-aviation-600 disabled:opacity-40 text-white text-sm font-medium px-4 py-2 rounded-xl transition-colors">
              {{ customAccessSaving ? 'Granting…' : 'Grant access' }}
            </button>
          </div>
        </div>
      </div>
    </Transition>

    <!-- Organisation detail / invites modal -->
    <Transition name="fade">
      <div v-if="orgDetail" class="fixed inset-0 z-50 flex items-center justify-center p-4">
        <div class="absolute inset-0 bg-slate-900/40" @click="orgDetail = null" />
        <div class="relative bg-white rounded-2xl shadow-xl w-full max-w-lg p-6 max-h-[85vh] overflow-y-auto">
          <h3 class="text-base font-semibold text-slate-900 mb-1">{{ orgDetail.organisation.name }}</h3>
          <p class="text-sm text-slate-500 mb-4">{{ orgDetail.organisation.trial_days }}-day trial on sign-up or login.</p>

          <form @submit.prevent="sendInvites" class="mb-5">
            <label class="block text-xs text-slate-400 uppercase tracking-wide mb-1">Invite emails (up to 10, one per line or comma-separated)</label>
            <textarea v-model="inviteEmailsText" rows="3" placeholder="student1@school.com, student2@school.com"
              class="w-full bg-white border border-slate-300 rounded-xl px-3 py-2 text-sm text-slate-900 focus:outline-none focus:ring-2 focus:ring-aviation-500"></textarea>
            <div class="flex justify-end mt-2">
              <button type="submit" :disabled="orgInviting"
                class="bg-aviation-500 hover:bg-aviation-600 disabled:opacity-40 text-white text-sm font-medium px-4 py-2 rounded-xl transition-colors">
                {{ orgInviting ? 'Sending…' : 'Send invites' }}
              </button>
            </div>
          </form>

          <table class="w-full text-sm">
            <thead>
              <tr class="border-b border-slate-200 text-left text-xs text-slate-400 uppercase tracking-wide">
                <th class="py-2 font-medium">Email</th>
                <th class="py-2 font-medium">Status</th>
                <th class="py-2 font-medium text-right">Actions</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="inv in orgDetail.invites" :key="inv.id" class="border-b border-slate-100 last:border-0 align-top">
                <td class="py-2">
                  <p class="text-slate-900">{{ inv.email }}</p>
                  <p v-if="inv.user_name" class="text-slate-400 text-xs">{{ inv.user_name }}</p>
                </td>
                <td class="py-2">
                  <span class="inline-flex items-center px-2 py-0.5 rounded-full text-xs font-medium"
                    :class="statusBadge(inv.status)">{{ inv.status }}</span>
                  <p v-if="inv.trial_expires_at" class="text-slate-400 text-xs mt-1">until {{ formatDate(inv.trial_expires_at) }}</p>
                </td>
                <td class="py-2 text-right">
                  <button v-if="inv.status === 'pending'" @click="revokeInvite(inv)" class="text-red-500 hover:text-red-600 text-xs font-medium">Revoke</button>
                </td>
              </tr>
            </tbody>
          </table>
          <p v-if="!orgDetail.invites.length" class="text-center text-slate-400 text-sm py-6">No invites sent yet.</p>

          <div class="flex justify-end mt-4">
            <button @click="orgDetail = null" class="text-sm font-medium text-slate-500 hover:text-slate-700 px-4 py-2 rounded-xl">Close</button>
          </div>
        </div>
      </div>
    </Transition>

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

    <!-- Delete transaction confirmation modal -->
    <Transition name="fade">
      <div v-if="txDeleteTarget" class="fixed inset-0 z-50 flex items-center justify-center p-4">
        <div class="absolute inset-0 bg-slate-900/40" @click="txDeleteTarget = null" />
        <div class="relative bg-white rounded-2xl shadow-xl w-full max-w-sm p-6">
          <h3 class="text-base font-semibold text-slate-900 mb-2">Delete this transaction?</h3>
          <p class="text-sm text-slate-500 mb-6">
            <span class="font-medium text-slate-700">{{ txDeleteTarget.description }}</span>
            ({{ formatAmount(txDeleteTarget.amount_cents, txDeleteTarget.currency) }}, {{ txDeleteTarget.user_email }})
            will be removed from the ledger only — this doesn't touch Stripe or the customer's access.
          </p>
          <div class="flex justify-end gap-3">
            <button @click="txDeleteTarget = null"
              class="text-sm font-medium text-slate-500 hover:text-slate-700 px-4 py-2 rounded-xl">
              Cancel
            </button>
            <button @click="performDeleteTransaction" :disabled="txDeleting"
              class="text-sm font-medium bg-red-500 hover:bg-red-600 disabled:opacity-50 text-white px-4 py-2 rounded-xl transition-colors">
              {{ txDeleting ? 'Deleting…' : 'Delete transaction' }}
            </button>
          </div>
        </div>
      </div>
    </Transition>

    <!-- Delete organisation confirmation modal -->
    <Transition name="fade">
      <div v-if="orgDeleteTarget" class="fixed inset-0 z-50 flex items-center justify-center p-4">
        <div class="absolute inset-0 bg-slate-900/40" @click="orgDeleteTarget = null" />
        <div class="relative bg-white rounded-2xl shadow-xl w-full max-w-sm p-6">
          <h3 class="text-base font-semibold text-slate-900 mb-2">Delete this organisation?</h3>
          <p class="text-sm text-slate-500 mb-6">
            <span class="font-medium text-slate-700">{{ orgDeleteTarget.name }}</span> and its invite list will be
            removed. Students who already accepted keep their access — only the school record is deleted.
          </p>
          <div class="flex justify-end gap-3">
            <button @click="orgDeleteTarget = null"
              class="text-sm font-medium text-slate-500 hover:text-slate-700 px-4 py-2 rounded-xl">
              Cancel
            </button>
            <button @click="performDeleteOrg" :disabled="orgDeleting"
              class="text-sm font-medium bg-red-500 hover:bg-red-600 disabled:opacity-50 text-white px-4 py-2 rounded-xl transition-colors">
              {{ orgDeleting ? 'Deleting…' : 'Delete organisation' }}
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
  custom_module_codes: string[] | null
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

interface Organisation {
  id: number
  name: string
  contact_name: string | null
  contact_email: string | null
  trial_days: number
  notes: string | null
  created_at: string
  invited_count: number
  accepted_count: number
}

interface OrgInvite {
  id: number
  email: string
  status: 'pending' | 'accepted' | 'revoked'
  invited_at: string
  accepted_at: string | null
  user_id: string | null
  user_name: string | null
  trial_expires_at: string | null
}

const tab = ref<'users' | 'transactions' | 'organisations'>('users')

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

interface ModuleListItem {
  code: string
  title: string
}

const allModules = ref<ModuleListItem[]>([])
const customAccessTarget = ref<AdminUser | null>(null)
const customAccessForm = reactive({ moduleCodes: [] as string[], days: 30 })
const customAccessSaving = ref(false)

function openCustomAccess(u: AdminUser) {
  customAccessTarget.value = u
  customAccessForm.moduleCodes = []
  customAccessForm.days = 30
  error.value = ''
}

async function grantCustomAccess() {
  if (!customAccessTarget.value) return
  customAccessSaving.value = true
  error.value = ''
  try {
    await api.post(`/api/v1/auth/admin/users/${customAccessTarget.value.id}/custom-access`, {
      module_codes: customAccessForm.moduleCodes,
      days: customAccessForm.days,
    })
    flashNotice(`Granted ${customAccessTarget.value.full_name} access to ${customAccessForm.moduleCodes.join(', ')} for ${customAccessForm.days} days.`)
    customAccessTarget.value = null
    await load()
  } catch (e: unknown) {
    error.value = (e as { response?: { data?: { error?: string } } })?.response?.data?.error ?? 'Could not grant access.'
  } finally {
    customAccessSaving.value = false
  }
}

async function load() {
  loading.value = true
  try {
    const [usersRes, plansRes, modulesRes] = await Promise.all([
      api.get('/api/v1/auth/admin/users'),
      api.get('/api/v1/auth/plans'),
      api.get('/api/v1/content/modules'),
    ])
    users.value = usersRes.data
    allPlans.value = plansRes.data
    allModules.value = modulesRes.data
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
const txDeleteTarget = ref<Transaction | null>(null)
const txDeleting = ref(false)

async function performDeleteTransaction() {
  if (!txDeleteTarget.value) return
  txDeleting.value = true
  try {
    await api.delete(`/api/v1/auth/admin/transactions/${txDeleteTarget.value.id}`)
    transactions.value = transactions.value.filter(t => t.id !== txDeleteTarget.value!.id)
    flashNotice('Transaction deleted.')
    txDeleteTarget.value = null
  } catch (e: unknown) {
    error.value = (e as { response?: { data?: { error?: string } } })?.response?.data?.error ?? 'Could not delete transaction.'
  } finally {
    txDeleting.value = false
  }
}

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

watch(tab, (t) => {
  if (t === 'transactions' && !transactions.value.length) loadTransactions()
  if (t === 'organisations' && !organisations.value.length) loadOrganisations()
})
watch([txFrom, txTo], () => { if (tab.value === 'transactions') loadTransactions() })

// Organisations tab — Part-147 school trials.
const organisations = ref<Organisation[]>([])
const orgsLoading = ref(false)
const orgCreating = ref(false)
const newOrg = reactive({ name: '', contact_email: '', trial_days: 14 })

async function loadOrganisations() {
  orgsLoading.value = true
  try {
    const res = await api.get('/api/v1/auth/admin/organisations')
    organisations.value = res.data
  } finally {
    orgsLoading.value = false
  }
}

async function createOrg() {
  orgCreating.value = true
  error.value = ''
  try {
    await api.post('/api/v1/auth/admin/organisations', {
      name: newOrg.name,
      contact_email: newOrg.contact_email,
      trial_days: newOrg.trial_days || 14,
    })
    newOrg.name = ''
    newOrg.contact_email = ''
    newOrg.trial_days = 14
    flashNotice('Organisation added.')
    await loadOrganisations()
  } catch (e: unknown) {
    error.value = (e as { response?: { data?: { error?: string } } })?.response?.data?.error ?? 'Could not add organisation.'
  } finally {
    orgCreating.value = false
  }
}

const editingOrgId = ref<number | null>(null)
const orgEditForm = reactive({ name: '', contact_name: '', contact_email: '', trial_days: 14 })
const orgEditSaving = ref(false)

function startEditOrg(o: Organisation) {
  editingOrgId.value = o.id
  orgEditForm.name = o.name
  orgEditForm.contact_name = o.contact_name ?? ''
  orgEditForm.contact_email = o.contact_email ?? ''
  orgEditForm.trial_days = o.trial_days
  error.value = ''
}

async function saveOrgEdit(o: Organisation) {
  orgEditSaving.value = true
  error.value = ''
  try {
    await api.patch(`/api/v1/auth/admin/organisations/${o.id}`, {
      name: orgEditForm.name,
      contact_name: orgEditForm.contact_name,
      contact_email: orgEditForm.contact_email,
      trial_days: orgEditForm.trial_days || 14,
    })
    editingOrgId.value = null
    flashNotice(`Updated ${orgEditForm.name}.`)
    await loadOrganisations()
  } catch (e: unknown) {
    error.value = (e as { response?: { data?: { error?: string } } })?.response?.data?.error ?? 'Could not save changes.'
  } finally {
    orgEditSaving.value = false
  }
}

const orgDeleteTarget = ref<Organisation | null>(null)
const orgDeleting = ref(false)

async function performDeleteOrg() {
  if (!orgDeleteTarget.value) return
  orgDeleting.value = true
  try {
    await api.delete(`/api/v1/auth/admin/organisations/${orgDeleteTarget.value.id}`)
    flashNotice(`Deleted ${orgDeleteTarget.value.name}.`)
    orgDeleteTarget.value = null
    await loadOrganisations()
  } catch (e: unknown) {
    error.value = (e as { response?: { data?: { error?: string } } })?.response?.data?.error ?? 'Could not delete organisation.'
  } finally {
    orgDeleting.value = false
  }
}

const orgDetail = ref<{ organisation: Organisation; invites: OrgInvite[] } | null>(null)
const inviteEmailsText = ref('')
const orgInviting = ref(false)

async function openOrg(o: Organisation) {
  const res = await api.get(`/api/v1/auth/admin/organisations/${o.id}`)
  orgDetail.value = res.data
  inviteEmailsText.value = ''
}

async function sendInvites() {
  if (!orgDetail.value) return
  const emails = inviteEmailsText.value.split(/[\n,]/).map(e => e.trim()).filter(Boolean)
  if (!emails.length) return
  orgInviting.value = true
  error.value = ''
  try {
    await api.post(`/api/v1/auth/admin/organisations/${orgDetail.value.organisation.id}/invites`, { emails })
    inviteEmailsText.value = ''
    flashNotice(`Invited ${emails.length} email(s).`)
    await openOrg(orgDetail.value.organisation)
    await loadOrganisations()
  } catch (e: unknown) {
    error.value = (e as { response?: { data?: { error?: string } } })?.response?.data?.error ?? 'Could not send invites.'
  } finally {
    orgInviting.value = false
  }
}

async function revokeInvite(inv: OrgInvite) {
  if (!orgDetail.value) return
  try {
    await api.delete(`/api/v1/auth/admin/organisations/${orgDetail.value.organisation.id}/invites/${inv.id}`)
    await openOrg(orgDetail.value.organisation)
    await loadOrganisations()
  } catch (e: unknown) {
    error.value = (e as { response?: { data?: { error?: string } } })?.response?.data?.error ?? 'Could not revoke invite.'
  }
}

function statusBadge(status: OrgInvite['status']) {
  if (status === 'accepted') return 'bg-green-50 text-green-700 border border-green-200'
  if (status === 'revoked') return 'bg-slate-100 text-slate-500 border border-slate-200'
  return 'bg-amber-50 text-amber-700 border border-amber-200'
}

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
