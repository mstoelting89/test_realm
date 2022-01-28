const state = {
    favoriteItems: []
}

const mutations = {
    ADD_FAVORITE_ITEM (state, payload) {
        state.favoriteItems.push(payload);
    },
    REMOVE_FAVORITE_ITEM (state, payload) {
        // filter funktion = Items, wo die Id nicht mit der Payload Id übereinstimmt, werden zurück ins array gepackt
        const filteredItems = state.favoriteItems.filter(favoriteItem => favoriteItem.id !== payload.id);
        state.favoriteItems = filteredItems;
    }
}

const actions = {
    addFavoriteItem({commit}, payload) {
        commit("ADD_FAVORITE_ITEM", payload);
    },
    removeFavoriteItem({commit}, payload) {
        commit("REMOVE_FAVORITE_ITEM", payload);
    }
}

const getters = {
    favoriteItems: state => state.favoriteItems,
    isFavorite: (state) => (productItem) => {
        const item = state.favoriteItems.find(favoriteItem => favoriteItem.id === productItem.id);
        return (item) ? true : false;
    }
}

const favoriteModule = {
    state,
    mutations,
    actions,
    getters
}

export default favoriteModule;