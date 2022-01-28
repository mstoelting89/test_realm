/*import Vue from 'vue'
import Vuex from 'vuex'
*/
import {createStore} from "vuex";

// Module -- im Pfad muss keine genaue Datei bezeichnet werden, da index.js automatisch gezogen wird
import cart from './modules/cart'
import product from './modules/product'
import favorite from './modules/favorite'
import auth from './modules/auth'

//Vue.use(Vuex);
/*
export default new Vuex.Store({
  modules: {
    cart,
    product,
    favorite,
    auth
  }
})
*/
const store = createStore({
  modules: {
    cart,
    product,
    favorite,
    auth
  }
});
export default store