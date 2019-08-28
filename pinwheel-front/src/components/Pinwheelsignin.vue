<template>
  <div class="max-w-sm m-auto my-8">
    <div class="border p-10 border-grey-light shadow rounded">
      <h3 class="text-2xl mb-6 text-grey-darkest">Super Sign Up</h3>
        <button @click="auth('github')" class="font-sans font-bold px-4 rounded cursor-pointer no-underline bg-green hover:bg-green-dark block w-full py-4 text-white items-center justify-center">auth Github</button>
        <div class="my-4"><router-link to="/" class="link-grey">Sign In</router-link></div>
    </div>
  </div>
</template>
<script>
export default {
  methods: {
    auth (provider) {
      this.$auth.authenticate(provider)
    }
  }
}
</script>
