import Vue from 'vue'
import Vuex from 'vuex'

// Module -- im Pfad muss keine genaue Datei bezeichnet werden, da index.js automatisch gezogen wird
import cart from './modules/cart'
import product from './modules/product'

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    cart,
    product
  }
})
