<template>
  <div class="card">
    <div
        class="card-header text-center"
        :class="[day.active === true ? activeClass : defaultClass]"
        style="cursor: pointer;"
        @click="setActiveDay(day.id)"
    >
      <strong>{{ day.fullName }}</strong>
    </div>
    <div class="card-body">
      <div>{{ day.id }}</div>
      <CalenderEvent
          v-for="(event, index) in day.events"
          :key="index"
          :event="event"
          :day="day" />

    </div>
  </div>
</template>

<script>
import CalenderEvent from "@/components/CalenderEvent";
import { store } from "@/store";

export default {
  name: "CalenderDay",
  props: ['day'],
  components: {
    CalenderEvent
  },
  data() {
    return {
      activeClass: 'bg-vue2',
      defaultClass: 'bg-vue'
    }
  },
  methods: {
    setActiveDay(dayId) {
      store.setActiveDay(dayId);
    }
  }
}
</script>

<style scoped>
.bg-vue {
  background-color: rgb(52,73,94);
  color: white;
}
.bg-vue2 {
  background-color: rgb(65,184,131);
  color: white;
}
</style>