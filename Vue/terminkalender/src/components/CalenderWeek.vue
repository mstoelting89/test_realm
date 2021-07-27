<template>
  <div class="container-fluid">
    <div class="row">
      <div class="col-12">
        <div class="card-group">
          <CalenderDay
            v-for="day in state.calenderWeekData"
            :key="day.id"
            :day="day"
          />
        </div>
      </div>
    </div>

  </div>
</template>

<script>
import { store } from "@/store";
import CalenderDay from "@/components/CalenderDay";

export default {
  name: "CalenderWeek",
  data() {
    return {
      state: store.state
    }
  },
  components: {
    CalenderDay
  }
}
</script>

<style scoped>

</style>