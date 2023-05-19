<template>
    <div>

        <v-toolbar flat app
        color="#582B9C"
        dark
        height="130px"
        >

        <v-toolbar-title class="text-uppercase pr-0">
        <span class="font-weight-light">GymTech</span>
          
        </v-toolbar-title>
        <v-col md="4">
        <v-spacer></v-spacer>
    </v-col>
        <v-toolbar-items class="pt-4 ml-10">
            
            <center class="mr-20"><h3 > <h1 >ADMIN PAGE</h1></h3></center>
           
      </v-toolbar-items>
      <v-col md="4">
        <v-spacer></v-spacer>
    </v-col>
           
          <v-btn flat dark @click="signOut" >
          <span>Sign Out</span>
          <v-icon right>exit_to_app</v-icon>
          
        </v-btn> 
      </v-toolbar>


    <div class="ml-16"> 
        <v-row class="ml-8 mr-8">
            <v-col md="4">
                <v-card
            dark 
            center
            rounded
            class=" mt-5 ml-5 mr-5"
            height="300px"
            width="300px"
            style = "background-color: white;"
            elevation="0"
            >
            <v-img  src="https://img.icons8.com/?size=512&id=PffeJsQDnOuo&format=png" cover></v-img>
        </v-card>
        <v-card 
            class="rounded-circle mt-2 mb-5 ml-16 "
            height="50px"
            width="300px"
            elevation="0"
            >
            <router-link  class="redirection" :to="{ path: './addGym'}"  active-class="active" ><a>  <v-btn  class="ml-1" dark><h2 class="mt-18">add new gym +</h2></v-btn></a></router-link>
 
           
        </v-card>
    </v-col>
    <v-col md="4">
                <v-card
            dark 
            center
            rounded
            class="rounded-circle mt-5 ml-5 mr-5"
            height="300px"
            width="300px"
            img="https://img.icons8.com/?size=512&id=i3WfjEq4h2JK&format=png"
            elevation="0"
            >
        </v-card>
        <v-card 
            class="rounded-circle mt-2 mb-5 ml-5 mr-5"
            height="50px"
            width="300px"
            elevation="0"
            >
            <router-link  class="redirection" :to="{ path: './addExercise'}"  active-class="active" ><a> <v-btn  class="ml-5" dark><h2 style="text-align:center" class="mt-18">add new exercise +</h2></v-btn></a></router-link>
 
           
        </v-card>
    </v-col>
    <v-col md="4">
                <v-card
            dark 
            center
            rounded
            class="rounded-circle mt-5 ml-5 mr-5"
            height="300px"
            width="300px"
            img="https://img.icons8.com/?size=512&id=kF2I9vwqugYq&format=png"
            elevation="0"
            >
        </v-card>
        <v-card 
            class="rounded-circle mt-2 mb-5 ml-5 mr-5"
            height="50px"
            width="300px"
            elevation="0"
            >
            <router-link  class="redirection" :to="{ path: './viewFeedback'}"  active-class="active" ><a> <v-btn class="ml-8" dark><h2 style="text-align:center" class="mt-18">view feedback</h2></v-btn></a></router-link>
 
            
        </v-card>
    </v-col>
        </v-row>
        
    </div>
    </div>
</template>
<script> 
export default {
    methods: {
        signOut () {
            this.$cookies.remove("admin");
            this.$router.replace("/")
        },
}, 


}

</script>
<style>

</style>