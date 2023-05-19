<template>
    <div class="background">
    <div>  
  <v-card
    class="mt-16 mx-auto rounded-xl"
    width="500"
    elevation="15"
    
   
  >
    <v-img
      class="white--text align-end"
      height="350px"
      :src="require('../../public/images/gymTech.jpg')"
    >
    </v-img>

    <v-card-title class="pb-0 title1">
      Get fit at your fingertips
    </v-card-title>

    <v-card-text class="text--primary mt-2">
      <div class="roboto">Already a GymBro? 
        <v-btn
        color="blue"
        text
        @click="goToSignin()"
      >
        Sign-In
      </v-btn></div>

      <div class="roboto">Not a GymBro?
        
      <v-btn
        color="blue"
        text
        @click="goToSignup()"
      >
        Sign-Up
      </v-btn>

      </div>
      <div class="roboto"> Admin?
        <v-btn
        color="blue"
        text
        @click="goToAdminLogin()"
      >
        Sign-In
      </v-btn>

      </div>
    </v-card-text>

    <v-card-actions>
      

    </v-card-actions>
  </v-card>
  
</div>
</div>
</template>
<script>
export default{
    components:{

    },
    data:()=>({
    
    }),
      
    methods:{
      goToSignup(){
        this.$router.push('/signup')
      },
      goToSignin() {
        this.$router.push('/signin')
      },
      goToAdminLogin(){
        this.$router.push('/adminLogin')
      }
    }
}
</script>
<style>
.background{
    background-color: #20262E;
    height: 100%;
}
.title1{
    font-family: 'Dancing Script', cursive;
    font-size: 2rem;
}
.roboto{
    font-family: 'Roboto', sans-serif;
}
</style>