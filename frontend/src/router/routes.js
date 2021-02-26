
const routes = [
  {
    path: '/',
    component: () => import('layouts/MainLayout.vue'),
    children: [
<<<<<<< HEAD
      { path: '', component: () => import('pages/Index.vue') },
      { path: '/login', component: () => import('pages/login.vue') },
    ]
  },
  {
    path: '/',
    component: () => import('layouts/MainLayout.vue'),
    children: [
      {
        path: '/dashboard',
        component: () => import('pages/dashboard.vue'),
        meta: { requiresAuth: true },
      },
    ]
  },
  { // 404 page
=======
      { path: '', component: () => import('pages/Index.vue') }
    ]
  },

  // Always leave this as last one,
  // but you can also remove it
  {
>>>>>>> base
    path: '*',
    component: () => import('pages/Error404.vue')
  }
]

export default routes
