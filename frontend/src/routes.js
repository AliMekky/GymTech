import home from './components/home.vue'
import signup from './components/signup.vue'
import signin from './components/signin.vue'
import adminLogin from './components/adminLogin'
import admin from './components/admin'
import addExercise from './components/addExercise'
import addGym from './components/addGym'
import viewFeedback from './components/viewFeedback'
import dashboard from './components/dashboard.vue'
import feedback from './components/addFeedback.vue'
import addWorkout from './components/addWorkout.vue'
import viewGyms from './components/viewGyms.vue'
import startWorkout from './components/startWorkout.vue'
export const routes= [
    {path:"", component:home, name:"home"},
    {path:"/signup", component:signup, name:"signup"},
    {path:"/signin", component:signin, name:"signin"},
    {path:"/adminLogin", component:adminLogin, name:"adminLogin"},
    {path:"/admin", component:admin, name:"admin"},
    {path:"/addExercise", component:addExercise, name:"addExercise"},
    {path:"/addGym", component:addGym, name:"addGym"},
    {path:"/viewFeedback", component:viewFeedback, name:"viewFeedback"},
    {path:"/dashboard", component:dashboard, name:"dashboard"},
    {path:"/feedback", component:feedback, name:"feedback"},
    {path:"/addWorkout", component:addWorkout, name:"addWorkout"},
    {path:"/gyms" ,component:viewGyms, name:"viewGyms"},
    {path:"/startWorkout",component:startWorkout,name:"startWorkout"}
];