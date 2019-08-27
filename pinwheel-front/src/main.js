// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import VueAxios from 'vue-axios'
import VueAuthenticate from 'vue-authenticate'
import './main.css'
import { securedAxiosInstance, plainAxiosInstance } from './backend/axios'

Vue.config.productionTip = false

Vue.use(VueAxios, {
  secured: securedAxiosInstance,
  plain: plainAxiosInstance
})

Vue.use(VueAuthenticate, {
  baseUrl: 'http://localhost:3000', // Your API domain

  providers: {
    github: {
      clientId: '',
      redirectUri: 'http://localhost:8080/auth/callback' // Your client app URL
    }
  }
})

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  securedAxiosInstance,
  plainAxiosInstance,
  components: { App },
  template: '<App/>',
  methods: {
    authenticate: function (provider) {
      this.$auth.authenticate(provider).then(function () {
        // Execute application logic after successful social authentication
      })
    }
  }
})
