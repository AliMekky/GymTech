/* eslint-disable */ 
import Vue from 'vue'
import App from './App.vue'
import Vuelidate from 'vuelidate'
import Vuetify from 'vuetify'
import 'vuetify/dist/vuetify.min.css'
import VueRouter from 'vue-router'
import {routes} from './routes';
import {store} from './store';
Vue.use(Vuetify);
Vue.use(Vuelidate);
Vue.use(require('vue-cookies'))
export default new Vuetify({
  icons:{
    iconfont:'mdiSvg'
  }
})
const router = new VueRouter({
  routes,
  mode: 'history',
});
Vue.use(VueRouter);
router.beforeEach((to,from,next)=>{
  if((to.name=="signin" || to.name=="signup") && $cookies.isKey("user")){
    next("/dashboard");
  }
  else{
    next();
  }
  if((to.name=="dashboard" || to.name=="addWorkout" || to.name=="viewGyms" || to.name=="startWorkout"  || to.name=="feedback") && !$cookies.isKey("user")){
    next("/");
  }else{
    next();
  }
  if((to.name=="admin" || to.name=="addExercise" || to.name=="viewFeedback" || to.name=="addGym" ) && !$cookies.isKey("admin")){
    next("/");
  }else{
    next();
  }
  if(to.name=="adminLogin" && $cookies.isKey("admin")){
    next("/admin")
  }else{
    next()
  }
})
new Vue({
  vuetify: new Vuetify(),
  router,
  store,
  el: '#app',
  render: h => h(App)
})
