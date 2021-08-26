<template>
  <nav class="navbar navbar-expand-lg bg-vue">
    <div class="container">
      <router-link to="/" class="navbar-brand">Der Shop</router-link>
      <ul class="navbar-nav mr-auto">
        <li class="nav-item">
          <router-link to="/" class="nav-link">Shop</router-link>
        </li>
      </ul>
      <ul class="navbar-nav">
        <li class="nav-item">
          <a href="" class="nav-link"><i class="fas fa-sign-in-alt mr-2"></i> Login</a>
        </li>
        <li class="nav-item bg-vue2 ml-4 rounded">
          <router-link to="/cart" class="nav-link"><i class="fas fa-cart-arrow-down"></i>{{ countOfCartItems }} Artikel ({{ cartTotal }}€)</router-link>
        </li>
      </ul>
    </div>
  </nav>
</template>

<script>
import { mapGetters } from 'vuex';
export default {
  name: "Navbar",
  computed: {
    ...mapGetters([
      'countOfCartItems',
      'cartTotal'
    ])
  }
}
</script>

<style scoped>
  a {
    color: white;
  }
  a:hover {
    opacity: 30%;
    transition: all .3s ease-out;
  }
</style>