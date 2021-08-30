<template>
  <div class="container-fluid">
    <div class="row">
      <div class="col-12">
        <Navbar></Navbar>
        <router-view></router-view>
      </div>
    </div>
  </div>
</template>

<script>
  import Navbar from './components/Navbar'

  export default {
    name: 'App',
    components: {
      Navbar
    },
    created() {
      const token = localStorage.getItem('token');
      if (token) {
        this.$store.dispatch('getCartItems', token);
        this.$store.dispatch('getProductItems', token);
      }

    }
  }
</script>

<style>
  .bg-vue {
    background-color: rgb(52, 73, 94);
    color: white;
  }
  .bg-vue2 {
    background-color: rgb(65, 184, 131);
    color: white;
  }
  .color-vue {
    color: rgb(52, 73, 94);
  }
  .color-vue2 {
    color: rgb(65, 184, 131);
  }

</style>