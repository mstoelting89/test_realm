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
            <button class="btn bg-vue px-5 mt-2" @click="signin"><i class="fas fa-key mr-2"></i>Einloggen</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "signin",
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