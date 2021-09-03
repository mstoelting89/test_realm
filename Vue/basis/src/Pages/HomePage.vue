<template>
  <div class="container">
    <div class="row">
      <div class="col-12">
        <p class="lead">
          Hallo
        </p>
        <button class="btn btn-primary" @click="openDialog">Dialog anzeigen</button>
        <Dialog v-if="showDialog" @close="closeDialog" :timeout="6000" :type="'success'">
          <template v-slot:header>
            <div>
              <h3>Slot gefüllt</h3>
            </div>
          </template>
          <template v-slot:body>
            <div>
              Sie haben Sich eingeloggt.
            </div>
          </template>
        </Dialog>
      </div>
    </div>
  </div>
</template>

<script>
import Dialog from "@/components/Dialog";
export default {
  name: "HomePage",
  components: {
    Dialog
  },
  data() {
    return {
      showDialog: false
    }
  },
  methods: {
    openDialog() {
      this.showDialog = true;
    },
    closeDialog() {
      this.showDialog = false;
    }
  }
}
</script>

<style scoped>

</style>