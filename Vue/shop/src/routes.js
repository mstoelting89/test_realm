import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)


import ProductList from './components/product/ProductList'
import CartList from "@/components/cart/CartList";
import ProductItem from "@/components/product/ProductItem";

const routes = [
    {
        path: '/',
        component: ProductList
    },
    {
        path: '/cart',
        component: CartList
    },
    {
        path: '/products/:id',
        component: ProductItem,
        props: true
    }
]

export const router = new VueRouter({
    mode: "history",
    routes
})