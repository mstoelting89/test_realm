<template>
  <div
      class="alert text-center"
      :class="getEventColor">
    <div
      v-if="!event.edit"
    >
      <div>{{ event.title }}</div>
      <div>
        <i class="fas fa-edit mr-2" style="cursor: pointer;" @click="editEvent(day.id, event.title)"></i>
        <i class="far fa-trash-alt" style="cursor: pointer;" @click="deleteEvent(day.id, event.title)"></i>
      </div>
    </div>
    <div v-if="event.edit">
      <input type="text" class="form-control" :placeholder="event.title" v-model="newEventTitle">
      <hr>
      <i class="fas fa-check" style="cursor: pointer;" @click="saveEvent(day.id, event.title, newEventTitle)"></i>
    </div>
  </div>
</template>

<script>
import { store } from "@/store";

export default {
  name: "CalenderEvent",
  props: ['event', 'day'],
  data() {
    return {
      newEventTitle: ''
    }
  },
  computed: {
    getEventColor() {
      return 'alert-' + this.event.color;
    }
  },
  methods: {
    editEvent(dayId, eventTitle) {
      store.editEvent(dayId, eventTitle);
    },
    saveEvent(dayId, eventTitle, newEventTitle) {
      if (newEventTitle === '') newEventTitle = eventTitle;
      store.setEventTitle(dayId, eventTitle, newEventTitle);
    },
    deleteEvent(dayId, eventTitle) {
      store.deleteEvent(dayId, eventTitle);
    }
  }
}
</script>

<style scoped>

</style>