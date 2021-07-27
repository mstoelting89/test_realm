<template>

    <div class="container mt-5">

      <div class="row">
        <div class="col-6 offset-3">
          <div class="text-center mb-3">
            <i class="far fa-trash-alt" style="cursor: pointer;" @click="deleteAllEvents"></i> Alle Termine löschen
          </div>

          <div class="card">
            <div class="card-header text-center bg-vue">
              <h5>Neuer Termin für: <strong>{{ getNameOfActiveDay }}</strong></h5>
            </div>
            <div class="card-body">
              <div
                  class="alert alert-danger"
                  v-if="error">
                  <!-- wenn sich text ändern soll, div wird neu gerendert -->
                  <!--v-show="error" div wird nicht neu gerendert, bekommt wird nur mit display none ausgeblendet-->
              {{ changeErrorClass }}</div>
              <input type="text" class="form-control" placeholder="Neuer Termin" v-model="eventTitle">
              <div class="mt-3 text-center square-wrapper">
                <span
                    class="alert mr-2 square"
                    v-for="(color, index) in ['primary','success', 'info', 'warning', 'danger']"
                    :key="index"
                    :class="[eventColor === color ? getBorderColor : '' , getBackgroundColor(color)]"
                    @click="changeEventColor(color)"
                ></span>
              </div>
              <hr>
              <button class="btn bg-vue2 btn-block" @click="storeEvent(eventTitle, eventColor)">Eintragen</button>
            </div>
          </div>
        </div>
      </div>
    </div>

</template>

<script>
import { store } from "@/store";

export default {
  name: "CalenderEntry",
  data() {
    return {
      eventColor: 'primary',
      eventTitle: '',
      error: false,
    }
  },
  computed: {
    getBorderColor() {
      return 'border border-' + this.eventColor;
    },
    getNameOfActiveDay() {
      return store.getActiveDay().fullName;
    },
    changeErrorClass() {
      if (this.eventTitle.length > 0) {
        this.setError(false);
        return '';
      } else {
        return 'Der Titel darf nicht leer sein ';
      }
    }
  },
  methods: {
    getBackgroundColor: function(color) {
      return 'alert-' + color;
    },
    changeEventColor: function(color) {
      this.eventColor = color;
    },
    storeEvent: function (eventTitle, eventColor) {
      if (eventTitle === '') {
        return this.error = true;
      }

      store.storeEvent(eventTitle, eventColor);
      this.eventTitle  = '';
      this.eventColor = 'primary'
    },
    setError: function(state) {
      this.error = state;
    },
    deleteAllEvents(){
      store.deleteAllEvents();
    }
  }
}
</script>

<style scoped>
.bg-vue2 {
  background-color: rgb(65, 184, 131);
  color: white;
}
.square {
  width: 40px;
  height: 40px;
  display:flex;
  cursor: pointer;
  justify-content:center;
  margin-right: 1rem;
}
.square-wrapper {
  display:flex;
  justify-content:center;
}
</style>