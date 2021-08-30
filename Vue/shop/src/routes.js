import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

import Signin from './components/auth/signin'

import ProductList from './components/product/ProductList'
import CartList from "@/components/cart/CartList";
import ProductItem from "@/components/product/ProductItem";
import NotFound from "@/components/error/NotFound";

const routes = [
    {
        path: '/login',
        component: Signin
    },
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
    },
    {
        path: '*',
        component: NotFound
    }
]

export const router = new VueRouter({
    mode: "history",
    routes
})