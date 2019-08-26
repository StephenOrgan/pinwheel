import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export const store = new Vuex.Store({
  state: {
    account: null
  },
  mutations: {
    setAccount (state, account) {
      state.account = account
    }
  },
  getters: {
    account: state => state.account
  }
})
