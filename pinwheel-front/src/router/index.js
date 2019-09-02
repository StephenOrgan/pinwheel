import Vue from 'vue'
import Router from 'vue-router'
import Login from '@/components/Login.vue'
import Signup from '@/components/Signup.vue'
import Pinwheelsignin from '@/components/Pinwheelsignin.vue'
import Githubadmin from '@/components/Githubadmin.vue'

Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'Login',
      component: Login
    },
    {
      path: '/signup',
      name: 'Signup',
      component: Signup
    },
    {
      path: '/pinwheel_sign_in',
      name: 'Pinwheelsignin',
      component: Pinwheelsignin
    },
    {
      path: 'auth/admin/callback/github',
      name: 'Githubadmin',
      component: Githubadmin
    }
  ]
})
