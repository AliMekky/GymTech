<template >
    <div class="background">
      
      <v-row>
      <v-spacer/>
      <v-col
      md="6"
          class="my-16">
    <v-card 

    round class="rounded-xl ma-16 pa-2"  >
        <v-toolbar rounded class="rounded-xl" >
                <v-spacer/>
                    <div><h1 class="header"> <center>FEEDBACK</center></h1></div>
                <v-spacer/>

        </v-toolbar>
    <form >
        <div>
            <v-spacer/>
                <div><h4 class="slogan mt-4"> Give feedback, receive growth.</h4></div>
            <v-spacer/>
        </div>
        <v-row class="ma-6">
                <v-textarea
                    v-model="feedback"
                    :error-messages="feedbackErrors"
                    counter
                    label="Feedback"
                    maxlength="200"
                    single-line
                    required
                    @blur="$v.feedback.$touch()"
                    ></v-textarea>
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
        Submit
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
import { required } from 'vuelidate/lib/validators'

import axios from 'axios';
const instance = axios.create({
    withCredentials: true
});
export default {
  mixins: [validationMixin],

  validations: {

    feedback: {required}
  },

  data: () => ({

    feedback: '',
  }),

  computed: {

    feedbackErrors(){
    const errors = []
      if (!this.$v.feedback.$dirty) return errors
      !this.$v.feedback.required && errors.push('feedback is required')
      return errors  
    }
  },

  methods: {
    submit () {
      this.$v.$touch();
      if(!this.feedbackErrors.length){
        
        instance.post("http://localhost:5000/feedback", {
          feedback: this.feedback,
          user_email: this.$cookies.get("user").email
        }).then(res=>{
          console.log(res);
          this.$router.replace('/dashboard');

        }).catch(()=>{
          alert("Something Went Wrong");
        });
      }
    },
    clear () {
      this.$v.$reset()
      this.feedback = ''
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
.slogan{
    text-align: center;
    font-family: 'Dancing Script', cursive;
}

.feedback{
    height: 10rem;
}
</style>