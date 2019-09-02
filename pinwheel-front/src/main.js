// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import axios from 'axios'
import VueAxios from 'vue-axios'
import VueAuthenticate from 'vue-authenticate'
import './main.css'
// import { securedAxiosInstance, plainAxiosInstance } from './backend/axios'
const API_URL = 'http://pinwheel2.pinwheelintegrations.local:3000'

axios.defaults.baseURL = API_URL
axios.defaults.xsrfCookieName = 'csrf'
axios.defaults.xsrfHeaderName = 'X-CSRF-TOKEN'
axios.defaults.withCredentials = true
axios.interceptors.request.use(config => {
  const method = config.method.toUpperCase()
  if (method !== 'OPTIONS' && method !== 'GET') {
    config.headers = {
      ...config.headers,
      'Content-Type': 'application/json',
      'X-CSRF-TOKEN': localStorage.csrf
    }
  }
  return config
})
axios.interceptors.response.use(null, error => {
  if (error.response && error.response.config && error.response.status === 401) {
    return axios.post('/refresh', {}, { headers: { 'X-CSRF-TOKEN': localStorage.csrf } })
      .then(response => {
        localStorage.csrf = response.data.csrf
        localStorage.signedIn = true

        let retryConfig = error.response.config
        retryConfig.headers['X-CSRF-TOKEN'] = localStorage.csrf
        return axios.request(retryConfig)
      }).catch(error => {
        delete localStorage.csrf
        delete localStorage.signedIn

        location.replace('/')
        return Promise.reject(error)
      })
  } else {
    return Promise.reject(error)
  }
})

Vue.config.productionTip = false

Vue.use(VueAxios, axios)

Vue.use(VueAuthenticate, {
  baseUrl: 'http://pinwheel2.pinwheelintegrations.local:3000',
  providers: {
    github: {
      name: 'github',
      clientId: 'Iv1.a10837c3149387ab',
      url: '/auth/github',
      authorizationEndpoint: 'https://github.com/login/oauth/authorize',
      redirectUri: 'http://pinwheelintegrations.local:3000/auth/admin/callback/github',
      oauthType: '2.0',
      popupOptions: { width: 495, height: 645 }
    }
  }
})

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
})
