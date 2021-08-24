<template>
  <div
      class="card m-3"
  >
    <img
        src="https://picsum.photos/200"
        class="card-img-top"
    >
    <ul class="actions">
      <li><button class="btn bg-vue" data-tip="Anschauen"><i class="fa fa-search"></i></button></li>
      <li><button class="btn bg-vue" data-tip="Merkzettel" @click="addProductToFavorite(productItem)" v-if="!isFavorite"><i class="far fa-heart"></i></button></li>
      <li><button class="btn bg-vue" data-tip="Merkzettel" @click="removeProductToFavorite(productItem)" v-if="isFavorite"><i class="fas fa-heart"></i></button></li>
      <li><button class="btn bg-vue" data-tip="Zum Warenkorb" @click="addItemToCart(productItem)"><i class="fa fa-shopping-cart"></i></button></li>
    </ul>

    <div v-if="getDiscount >= 20">
      <span class="product-sale-label bg-vue">Sale</span>
      <span class="product-discount-label bg-vue2">{{ getDiscount }}%</span>
    </div>



    <div class="card-body">
      <h6 class="card-title">{{ productItem.title }} <span class="float-right" v-if="isFavorite"><i class="fas fa-heart"></i></span></h6>
      <p class="card-subtitle text-muted">{{ productItem.description }}</p>
      <div class="text-center mt-3">
        <div class="lead">
          <strong class="color-vue">{{ productItem.price }}</strong>
          <span class="ml-4 color-vue2" v-if="productItem.price !== productItem.origPrice"><del>{{ productItem.origPrice }}</del></span>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapActions } from 'vuex'
export default {
  name: "ProductListItem",
  props: ['productItem'],
  computed: {
    getDiscount() {
      return parseFloat((1 - this.productItem.price/this.productItem.origPrice)*100).toFixed(0);
    },
    isFavorite() {
      return this.$store.getters.isFavorite(this.productItem);
    }
  },
  methods: {
    ...mapActions({
      addItemToCart: 'addCartItem',
      addProductToFavorite: 'addFavoriteItem',
      removeProductToFavorite: 'removeFavoriteItem'
    })
  }
}
</script>

<style scoped>
.actions {
  width:150px;
  padding:0;
  margin:0;
  list-style:none;
  opacity:0;
  transform:translateY(-50%) translateX(-50%);
  position:absolute;
  top:60%;left:50%;
  z-index:1;
  transition:all .3s ease 0s
}
.card:hover .actions {
  opacity: 1;
  top: 50%;
}
.card .actions li {
  display: inline-block;
}
.card .actions li button {
  color: #fff;
  background-color: rgb(52,73,94);
  font-size: 16px;
  line-height: 40px;
  text-align: center;
  height: 40px;
  width: 40px;
  margin: 0 2px;
  display: block;
  position: relative;
  transition: all .3s ease-in-out;
  padding: 0;
}

.card .actions li button:hover {
  color: #fff;
  background-color: rgb(65,184,131);
}

.card .actions li button:before {
  content: attr(data-tip);
  color: #fff;
  background-color: rgb(65,184,131);
  transition: all .3s ease-in-out;
  font-size: 12px;
  letter-spacing: 1px;
  line-height: 20px;
  padding: 1px 5px;
  white-space: nowrap;
  opacity: 0;
  transform: translateX(-50%);
  position: absolute;
  left: 50%;
  top: -30px
}

.card .actions li button:hover:before {
  opacity: 1
}

.card .product-discount-label,
.card .product-sale-label {
  color: #fff;
  background-color: rgb(52,73,94);
  font-size: 14px;
  text-transform: uppercase;
  padding: 4px 14px;
  display: block;
  position: absolute;
  top: 10px;
  left: 0
}

.card .product-discount-label {
  background-color: rgb(65,184,131);
  left: auto;
  right: 0
}
</style>