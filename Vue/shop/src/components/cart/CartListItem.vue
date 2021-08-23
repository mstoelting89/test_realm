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
    <td class="align-middle">
      <strong>{{ cartItem.quantity }}</strong>
    </td>
    <td class="align-middle">
      <i class="fa fa-trash"></i>
    </td>
  </tr>
</template>

<script>
export default {
  name: "CartListItem",
  props: ['cartItem']
}
</script>

<style scoped>

</style>