<template>
  <div id="app">
    <CalenderWeek />
    <CalenderEntry />

  </div>
</template>

<script>
import CalenderWeek from "@/components/CalenderWeek";
import CalenderEntry from "@/components/CalenderEntry";

export default {
  name: 'App',
  components: {
    CalenderEntry,
    CalenderWeek
  }

}
</script>

<style scoped>
  .bg-vue {
    background-color: rgb(52,73,94);
    color: white;
  }

</style>
