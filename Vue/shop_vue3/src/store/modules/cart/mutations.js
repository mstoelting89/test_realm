import * as types from "@/store/modules/cart/mutation-type";

export const mutations = {
    [types.UPDATE_CART_ITEMS](state, payload) {
        state.cartItems = payload;
    }
}