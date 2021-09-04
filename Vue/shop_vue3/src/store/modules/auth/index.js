import axios from "axios";

const state = {
    token: null,
    loading: false
}

const mutations = {
    SET_TOKEN (state, token) {
        state.token = token;
    },
    LOGIN_PENDING (state) {
        state.loading = true;
    },
    LOGIN_SUCCESS (state) {
        state.loading = false;
    },
    LOGIN_FAILED (state) {
        state.loading = false;
    }
}

const actions = {
    signin( {commit} ) {
        commit('LOGIN_PENDING');
        return axios.post('/api/login')
            .then((response) => {
                localStorage.setItem('token', response.data.token);
                commit('SET_TOKEN', response.data.token);
                commit('LOGIN_SUCCESS');
            })
            .catch((error) => {
                console.log(error);
                commit('LOGIN_FAILED');
            })
    },
    signout( {commit} ) {
        return new Promise((resolve) => {
            localStorage.removeItem('token');
            commit('SET_TOKEN', null);
            resolve();
        })
    }
}

const getters = {
    token: state => state.token,
    loading: state => state.loading
}

const authModule = {
    state,
    mutations,
    actions,
    getters
}

export default authModule;