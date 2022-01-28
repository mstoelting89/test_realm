<template>
  <div class="dialog-mask">
      <div class="dialog-container" :class="getType">
          <div class="dialog-header">
            <slot name="header">
              <h3>Willkommen</h3>
            </slot>
          </div>
          <div class="dialog-body">
            <slot name="body">
              <p>Hallo auf unserer Seite</p>
            </slot>
          </div>
          <div class="dialog-timer">
            <hr>
            Dialog schließt in {{ timeout / 1000 }} Sekunden
          </div>
      </div>
  </div>
</template>

<script>
export default {
  name: "Dialog",
  props: {
    timeout: {
      type: Number,
      default: 3000
    },
    type: {
      validator: function (value) {
        return ['success', 'warning', 'danger'].indexOf(value) !== -1
      },
      default: 'success'
    }
  },
  created() {
    setTimeout(() => {
      this.$emit('close')
    }, this.timeout)
  },
  computed: {
    getType() {
      return 'bg-' + this.type
    }
  },
  watch: {
    timeout: {
      handler(value) {
        if (value > 0) {
          setTimeout(() => {
            this.timeout -= 1000;
          }, 1000)
        }
      },
      immediate: true
    }
  }
}
</script>

<style scoped>
.dialog-mask {
  position: fixed;
  z-index: 9999;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0,0,0,0.5);
}
.dialog-container {
  width: 500px;
  margin: 0px auto;
  padding: 20px 30px;
  background-color: rgba(255,255,255);
  border-radius: 2px;
  box-shadow: 0 2px 8px rgba(0,0,0,0.33);
}
.dialog-timer {
  color:black;
  font-size: 12px;
}
</style>