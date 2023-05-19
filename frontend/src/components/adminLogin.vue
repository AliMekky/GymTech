<template >
    <div class="background">
      <v-snackbar 
              top 
              timeout="3500" 
              v-model="invalid" 
              color="error">
                  Incorrect email or password, please try again later
          </v-snackbar>
      <v-row>
      <v-spacer/>
      <v-col
      md="8"
          class="my-16">
    <v-card 
  
    round class="rounded-xl ma-16 pa-2"  >
        <v-toolbar rounded class="rounded-xl" >
          <v-spacer/><h1 class="header">ADMIN LOGIN</h1><v-spacer/>
        </v-toolbar>
    <form >
        <v-row class="ma-6">
                <v-text-field 
                 v-model="email"
                 :error-messages="emailErrors"
                 label="Admin E-mail"
                 required
                 @blur="$v.email.$touch()"
                ></v-text-field>
                </v-row>
                <v-row class="ma-6">
                <v-text-field
                 type="password"
                 v-model="password"
                 :error-messages="passwordErrors"
                 label="Admin Password"
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
  import { mapGetters } from 'vuex'
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
    adminEmail: 'mina@koleya.com',
    adminPassword: '1234'
  
  }),
  
  computed: {
    ...mapGetters(['getAdmin']),
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
      this.$v.$touch()
      if(this.getAdmin.email==this.email && this.getAdmin.password ==this.password){
        this.$cookies.set("admin","Verified admin",0);
        this.$router.replace("/admin");
      }else{
        this.invalid=true;
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
  <style>
  .background {
    height:100%;
    width:100%;
    background-repeat: no-repeat;
    background-size: cover;
  }
  .toolBar{
    background-color:lightgray;
  }
  .header{
    text-align: center;
  }
  </style>