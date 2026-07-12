import { createRouter, createWebHistory } from 'vue-router'
import { useAuthStore } from '@/stores/auth'

const router = createRouter({
  history: createWebHistory('/'),
  routes: [
    {
      path: '/auth',
      component: () => import('@/layouts/AuthLayout.vue'),
      children: [
        { path: 'login',    name: 'login',    component: () => import('@/views/auth/LoginView.vue') },
        { path: 'register', name: 'register', component: () => import('@/views/auth/RegisterView.vue') },
      ],
    },
    {
      path: '/',
      component: () => import('@/layouts/AppLayout.vue'),
      meta: { requiresAuth: true },
      children: [
        { path: '',         name: 'dashboard', component: () => import('@/views/DashboardView.vue') },
        { path: 'modules',  name: 'modules',   component: () => import('@/views/ModulesView.vue') },
        { path: 'modules/:id', name: 'module', component: () => import('@/views/ModuleView.vue') },
        { path: 'subjects/:id', name: 'subject', component: () => import('@/views/SubjectView.vue') },
        { path: 'ai',       name: 'ai',        component: () => import('@/views/AIInstructorView.vue') },
        { path: 'exam',     name: 'exam-setup', component: () => import('@/views/ExamSetupView.vue') },
        { path: 'exam/:id', name: 'exam',      component: () => import('@/views/ExamView.vue') },
        { path: 'results/:id', name: 'results', component: () => import('@/views/ResultsView.vue') },
      ],
    },
    { path: '/:pathMatch(.*)*', redirect: '/' },
  ],
})

router.beforeEach((to) => {
  const auth = useAuthStore()
  if (to.meta.requiresAuth && !auth.isAuthenticated) {
    return { name: 'login' }
  }
  if ((to.name === 'login' || to.name === 'register') && auth.isAuthenticated) {
    return { name: 'dashboard' }
  }
})

export default router
