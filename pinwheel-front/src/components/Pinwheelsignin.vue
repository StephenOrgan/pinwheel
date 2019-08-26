<template>
  <div class="max-w-sm m-auto my-8">
    <div class="border p-10 border-grey-light shadow rounded">
      <h3 class="text-2xl mb-6 text-grey-darkest">Sign Up</h3>
      <form @submit.prevent="pinwheelsignin">
        <div class="text-red" v-if="error">{{ error }}</div>

        <div class="mb-6">
          <label for="email" class="label">E-mail Address</label>
          <input type="email" v-model="email" class="input" id="email" placeholder="email@example.com">
        </div>

        <div class="mb-6">
          <label for="password" class="label">Password</label>
          <input type="password" v-model="password" class="input" id="password" placeholder="Password">
        </div>

        <div class="mb-6">
          <label for="password_confirmation" class="label">Password Confirmation</label>
          <input type="password" v-model="password_confirmation" class="input" id="password_confirmation" placeholder="Password Confirmation">
        </div>
        <button type="submit" class="font-sans font-bold px-4 rounded cursor-pointer no-underline bg-green hover:bg-green-dark block w-full py-4 text-white items-center justify-center">Sign Up</button>

        <div class="my-4"><router-link to="/" class="link-grey">Sign In</router-link></div>
      </form>
    </div>
  </div>
</template>
<script>
export default {
  name: 'Subdomain',
  data () {
    return {
      subdomains: '',
      error: ''
    }
  },
  created () {
    this.checkValidDomains()
  },
  methods: {
    getSubdomains () {
      this.$http.plain.get('/subdomains')
        .then(response => this.subdomainSuccessful(response))
        .catch(error => this.subdomainFailed(error))
    },
    subdomainSuccessful (response) {
      if (!response.status === 200) {
        this.subdomainFailed(response)
        return
      }
      localStorage.ValidDomains = response
      console.log(response)
    },
    subdomainFailed (error) {
      this.error = (error.response && error.response.data && error.response.data.error) || 'Something went wrong'
      console.log(this.error)
    },
    checkValidDomains () {
      if (localStorage.ValidDomains) {
        console.log(localStorage.ValidDomains)
      }
    }
  }
}
</script>
