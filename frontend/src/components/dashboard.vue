<template>
    <div class="background">
        <v-toolbar flat app
                dark
                height="50px"
                >

                <v-toolbar-title class="text-uppercase pr-0">
                <span class="font-weight-light">GymTech</span>
                
                </v-toolbar-title>
                <v-spacer/>
                <v-btn right flat dark @click="signOut" >
                <span>Sign Out</span>
                <v-icon right>exit_to_app</v-icon>
                
                </v-btn> 
      </v-toolbar>
        <v-row class="mt-10 mx-4">
            <v-col
                md="5">
                <personalInfo :user_info="user_info"/>
            </v-col>
            <v-col
                md="4">
                    <myLine :frequencies="frequencies"
                    />
            </v-col>
            <v-col
                md="3">
                <vol :volumes="volumes"/>
            </v-col>
        </v-row>
        <v-row class="mt-10 mx-4">
            <v-col
                md="6">
                <savedWorkouts :workouts="workouts"/>
            </v-col>
            <v-col
                md="6">
                <badges :frequencies="frequencies"/>
            </v-col>
        </v-row>
    </div>
</template>
<script>
import axios from 'axios';
import myLine from './myLine.vue';
import vol from './vol.vue';
import personalInfo from './personalInfo.vue';
import savedWorkouts from './savedWorkouts.vue';
import badges from './badges.vue'
export default{
    components:{
    myLine,
    vol,
    personalInfo,
    savedWorkouts,
    badges
},

data:()=>({
    user_info:[],
    frequencies:[],
    volumes:[],
    workouts:[]

}),
methods:{
    signOut () {
            this.$cookies.remove("user");
            this.$router.replace("/")
        },
},
    created(){
        axios.post("http://localhost:5000/dashboardData",{
            email: this.$cookies.get("user").email
        }).then(res=>{
            this.user_info=res.data.user_info
            this.frequencies=res.data.frequencies
            this.volumes=res.data.volumes
            this.workouts=res.data.workouts
            console.log(res.data)
            
            
        }).catch(()=>{
            alert("Something Went Wrong");
        });
        console.log("Outside axios")
},
}
</script>
<style scoped>
.background{
    background-color: #F6F1F1;
    height: 100%;
}
</style>