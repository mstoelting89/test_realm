<template>
  <div class="container-fluid">
    <div class="row">
      <div class="col-12">
        <Navbar v-if="$route.path !== '/login'"></Navbar>
        <router-view></router-view>
      </div>
    </div>
  </div>
</template>

<script>
  import Navbar from './components/Navbar'
  import { mapGetters } from 'vuex';
  export default {
    name: 'App',
    components: {
      Navbar
    },
    computed: {
      ...mapGetters([
          'token'
      ])
    },
    created() {
      const token = localStorage.getItem('token');

      if (token) {
        this.$store.dispatch('getCartItems', token);
        this.$store.dispatch('getProductItems', token);
      }
    },
    watch: {
      token() {
        if(this.token) {
          this.$store.dispatch('getCartItems', this.token);
          this.$store.dispatch('getProductItems', this.token);
        }
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