<template>
  <div class="container mt-5" v-if="productItem">
    <div class="row">
      <div class="col-12">
        <div class="card">
          <div class="row no-gutters">
            <div class="col-4">
              <img src="https://picsum.photos/400" class="card-img">
            </div>
            <div class="col-8">
              <div class="card-body">
                <h5 class="card-title mb-4 align-middle">
                  {{ productItem.title }}
                  <button class="float-right btn bg-vue2 px-4" @click="addToCart(productItem)">
                    <i class="fas fa-cart-plus mr-3"></i> {{ productItem.price }}
                  </button>
                  <button class="float-right btn btn-light" @click="$router.go(-1)"><i class="fas fa-arrow-left"></i> Zurück</button>
                </h5>
                <p class="card-text">
                  {{ productItem.description }}
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "ProductItem",
  props: ['id'],
  computed: {
    /* Problem: beim Erstellen der Component werden Daten vom Server geholt, aber Code geht weiter...deswegen Fehler
    Wenn die Daten dann da sind, wird computed neu ausgeführt und wir sehen deshalb alle daten -> trotzdem: Asyncronität beachten
     */
    productItem () {
      return this.$store.getters.productItemById(Number(this.id));
    }
  },
  methods: {
    addToCart(productItem) {
      /* Problem: 'dispatch...' sendet Anfrage an Server und Server verarbeitet diese, aber wenn der Server zu lange braucht
      * wird man währenddessen mit '$router.push' weitergeleitet, obwohl server noch gar nicht fertig ist */
      //this.$store.dispatch("addCartItem", productItem);
      //this.$router.push('/cart');
      /* Lösung: 'addCartItem' liefert Promise zurück mit return (in actions.js) und hier kann der Promise verarbeitet werden
      und mit then kann die weiterleitung passen, sobald server fertig ist
       */
      this.$store
          .dispatch("addCartItem", productItem)
          .then(() => {
            this.$router.push('/cart');
          });


    }
  }
}
</script>

<style scoped>

</style>