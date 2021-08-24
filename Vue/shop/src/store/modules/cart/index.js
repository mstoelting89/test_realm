import * as types from "./mutation-type";
import { actions } from "@/store/modules/cart/actions";

const state = {
    cartItems: []
}

const mutations = {
    [types.UPDATE_CART_ITEMS](state, payload) {
        state.cartItems = payload;
    }
}

const getters = {
    cartItems: state => state.cartItems,
    cartTotal: state => {
        return state.cartItems.reduce((acc, cartItem) => {
            return (cartItem.quantity * cartItem.price) + acc;
        }, 0).toFixed(2);
    },
    countOfCartItems: state => {
        return state.cartItems.reduce((acc, cartItem) => {
            return cartItem.quantity + acc;
        }, 0);
    }
}

const cartModule = {
    state,
    mutations,
    actions,
    getters
}

export default cartModule;