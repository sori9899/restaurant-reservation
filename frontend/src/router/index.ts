import { createRouter, createWebHistory } from 'vue-router'

const routes = [
  {
    path: '/',
    redirect: '/home'
  },
  {
    path: '/home',
    component: () => import('@/layouts/default/Default.vue'),
    children: [
      {
        path: '',
        name: 'Home',
        component: () => import('@/views/Home.vue'),
      }
    ],
  },
  {
    path: '/search',
    component: () => import('@/views/Search.vue'),
  },
  {
    path: '/restaurants',
    component: () => import('@/views/RestaurantList.vue'),
  },
  {
    path: '/restaurants/:id',
    component: () => import('@/views/RestaurantDetail.vue'),
  },
  {
    path: '/detail',
    component: () => import('@/views/Detail.vue')
  },
  {
    path: '/register',
    component: () => import('@/views/Regist.vue')
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
})

export default router
