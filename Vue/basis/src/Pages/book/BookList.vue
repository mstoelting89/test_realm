<template>
  <div>
    <p class="lead">Bücherliste</p>
    <div v-html="dummyText">
    </div>
  </div>
</template>

<script>
export default {
  name: "BookList",
  data() {
    return {
      dummyText: ''
    }
  },
  created() {
    this.$axios.get('api/10/medium/ol/headers/code')
        .then((response) => {
          this.dummyText = response.data
        })
  }
}
</script>

<style scoped>

</style>