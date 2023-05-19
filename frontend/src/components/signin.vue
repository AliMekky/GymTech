<template >
    <div class="background">
      <v-snackbar 
            top 
            timeout="3500" 
            v-model="invalid" 
            color="error">
                Invalid username or password
        </v-snackbar>
      <v-row>
      <v-spacer/>
      <v-col
      md="6"
          class="my-16">
    <v-card 

    round class="rounded-xl ma-16 pa-2"  >
        <v-toolbar rounded class="rounded-xl" >
          <v-spacer/><h1 class="header"> <center>LOGIN</center></h1><v-spacer/>
        </v-toolbar>
    <form >
        <v-row class="ma-6">
                <v-text-field 
                 v-model="email"
                 :error-messages="emailErrors"
                 label="E-mail"
                 required
                 @blur="$v.email.$touch()"
                ></v-text-field>
                </v-row>
                <v-row class="ma-6">
                <v-text-field
                 type="password"
                 v-model="password"
                 :error-messages="passwordErrors"
                 label="Password"
                 required
                 @blur="$v.password.$touch()"
                ></v-text-field>
              </v-row>    

     <v-row class="ma-10">
      <v-btn
        color="black"
        rounded
        dark
        absolute 
        right 
        class="mr-4 "
        @click="submit"
      >
        login
      </v-btn>
    </v-row>
    </form>
    </v-card>
  </v-col>
  <v-spacer/>
</v-row>
    </div>
  </template>


<script>
import { validationMixin } from 'vuelidate'
import { required, email } from 'vuelidate/lib/validators'
//import { mapGetters } from 'vuex'
import axios from 'axios';
const instance = axios.create({
    withCredentials: true
});
export default {
  mixins: [validationMixin],

  validations: {
    email: { required, email },
    password: {required}
  },

  data: () => ({
    password: '',
    email: '',
    invalid:false,
  }),

  computed: {
    emailErrors () {
      const errors = []
      if (!this.$v.email.$dirty) return errors
      !this.$v.email.email && errors.push('Must be valid e-mail')
      !this.$v.email.required && errors.push('E-mail is required')
      return errors
    },
    passwordErrors(){
      const errors = []
      if (!this.$v.password.$dirty) return errors
      !this.$v.password.required && errors.push('Password is required')
      return errors
    }
  },

  methods: {
    submit () {
      this.$v.$touch();
      if(!this.emailErrors.length && !this.passwordErrors.length){
        
        instance.post("http://localhost:5000/signin", {
          email: this.email,
          password: this.password,
        }).then(res=>{
          console.log(res);
          if(res.data.success){
            let fname=res.data.fname;
            let lname=res.data.lname;
            let user={email:this.email, fname:fname, lname:lname}
            console.log(user);
            this.$cookies.set("user",user,0);
            //this.$store.dispatch('setAuthenticated')
            //this.$store.dispatch('modifyLoggedInUser',user);
            this.$router.replace('/dashboard');
          }
          else if(!res.data.success){
            this.invalid=true;
          }
        }).catch(()=>{
          alert("Something Went Wrong");
        });
      }
    },
    clear () {
      this.$v.$reset()
      this.email = ''
      this.password=''
    },


  },
}
</script>
<style scoped>
.background {
    background-color: #20262E;
    height:100%;
}
.toolBar{
    background-color:lightgray;
}
.header{
    text-align: center;
}
</style>