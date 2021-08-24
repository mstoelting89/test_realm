<template>
  <tr>
    <th>
      <div class="p-2">
        <img
            src="https://picsum.photos/70"
            width="70"
            class="img-fluid rounded shadow-sm"
        >
        <div class="ml-3 d-inline-block align-middle">
          <h5 class="mb-0">
            <div class="text-dark d-inline-block align-middle">{{ cartItem.title }}</div>
          </h5>
          <span class="text-muted font-weight-normal font-italic">Kategorie: Uhren</span>
        </div>
      </div>
    </th>
    <td class="align-middle">
      <strong>{{ cartItem.price }} €</strong>
    </td>
    <td class="align-middle text-center">
      <strong>{{ cartItem.quantity }}</strong>
      <div>
        <i class="fas fa-plus-circle mr-2" @click="addCartItem(cartItem)"></i>
        <i class="fas fa-minus-circle" @click="removeCartItem(cartItem)"></i>
      </div>

    </td>
    <td class="align-middle">
      <i class="fa fa-trash" @click="removeCompleteItem(cartItem)"></i>
    </td>
  </tr>
</template>

<script>
import { mapActions } from 'vuex';
export default {
  name: "CartListItem",
  props: ['cartItem'],
  methods: {
    ...mapActions([
        'addCartItem',
        'removeCartItem',
        'removeCompleteItem'
    ])
  }
}
</script>

<style scoped>

</style>