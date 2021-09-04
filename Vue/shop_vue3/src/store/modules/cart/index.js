import { actions } from "@/store/modules/cart/actions";
import { state } from "@/store/modules/cart/state";
import { mutations } from "@/store/modules/cart/mutations";
import { getters } from "@/store/modules/cart/getters";

const cartModule = {
    state,
    mutations,
    actions,
    getters
}

export default cartModule;