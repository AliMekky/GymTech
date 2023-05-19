/* eslint-disable */ 
import Vue from "vue";
import Vuex from 'vuex';
Vue.use(Vuex);
export const store = new Vuex.Store({
    state: {
        admin:{
            email:'mina@koleya.com',
            password:'1234'
        },
        frequencies:[],
        badges:[{ name:"Merciless" ,src:"https://i.ytimg.com/vi/7fxTCRJCMnE/hqdefault.jpg" ,desc:"Earned for training 10 days in a row" },
                { name:"Avenger" ,src:"https://codmwstore.com/wp-content/uploads/2020/11/Point-of-Honour.jpg", desc:"Earned for training 20 days in a row"}]
        
    },
    mutations: {
        setFrequencies(state,payload){
            state.frequencies=payload
            console.log(state.frequencies)
        }
    },
    actions: {
        setFrequencies({commit},payload){
            commit('setFrequencies',payload)
        }
    },
    getters: {
        getAdmin:function(state){
            return state.admin
        },
        getFrequencies:function(state){
            return state.frequencies
        },
        getBadges:function(state){
            return state.badges
        }
        
    }
})
