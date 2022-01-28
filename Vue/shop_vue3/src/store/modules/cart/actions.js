import axios from "axios";
import * as types from "./mutation-type";

export const actions = {
    getCartItems({ commit }, token) {
        axios.get(`/api/cart?token=${token}`)
            .then((response) => {
                commit(types.UPDATE_CART_ITEMS, response.data)
            });
    },
    addCartItem({ commit }, payload) {
        return axios.post('/api/cart', payload)
            .then((response) => {
                commit(types.UPDATE_CART_ITEMS, response.data)
            });
    },
    removeCartItem({ commit }, payload) {
        axios.post('/api/cart/delete', payload)
            .then((response) => {
                commit(types.UPDATE_CART_ITEMS, response.data)
            });
    },
    removeAllCartItems({ commit }) {
        axios.post('/api/cart/delete/all')
            .then((response) => {
                commit(types.UPDATE_CART_ITEMS, response.data)
            });
    },
    removeCompleteItem({ commit }, payload) {
        axios.post('/api/cart/product/delete', payload)
            .then((response) => {
                commit(types.UPDATE_CART_ITEMS, response.data)
            });
    }
}