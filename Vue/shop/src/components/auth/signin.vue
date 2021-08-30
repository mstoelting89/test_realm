<template>
  <div style="height:50vh;">
    <div class="container h-100">
      <div class="row align-items-center h-100">
        <div class="col-8 mx-auto">
          <div class="jumbotron text-center">
            <h3>Willkommen in unserem Shop</h3>
            <hr>
            <p class="lead">
              Um sich unser exklusives Sortiment anschauen zu können, müssen sie sich einloggen
            </p>
            <button class="btn bg-vue px-5 mt-2" @click="signin" v-if="!loading"><i class="fas fa-key mr-2"></i>Einloggen</button>
            <button class="btn bg-vue px-5 mt-2" v-if="loading">
              <span class="spinner-border spinner-border-sm mr-3"></span>
              <span>Bitte warten...</span>
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex';
export default {
  name: "signin",
  computed: {
    ...mapGetters([
        'loading'
    ])
  },
  methods: {
    signin() {
      this.$store
          .dispatch('signin')
          .then(() => {
            this.$router.push('/')
          });
    }
  }
}
</script>

<style scoped>

</style>