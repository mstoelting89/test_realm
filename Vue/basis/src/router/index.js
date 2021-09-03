import Vue from 'vue';
import VueRouter from "vue-router";

Vue.use(VueRouter)

import routes from "./routes";

export default new VueRouter({
    mode: process.env.VUE_APP_VUE_ROUTER_MODE,
    routes
})