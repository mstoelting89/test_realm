<template>
  <div class="container">
    <div class="row">
      <div class="col-12">
        <div class="row">
          <div class="col-3"
               v-for="productItem in productItems"
               :key="productItem.id"
          >
            <ProductListItem
                :productItem="productItem"
            ></ProductListItem>
          </div>
        </div>
      </div>
    </div>

  </div>
</template>
<script>
import ProductListItem from "@/components/product/ProductListItem";
export default {
  name: 'ProductList',
  components: {
    ProductListItem
  },
  computed: {
    productItems() {
      return this.$store.getters.productItems;
    }
  }
}
</script>
<style scoped>

</style>