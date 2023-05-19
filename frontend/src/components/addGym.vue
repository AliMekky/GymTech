<template>
    <div class="adminBackgroud">
      <v-row>
        <v-spacer />
        <v-col md="8" class="my-16">
          <v-card round class="rounded-xl ma-16 pa-2" >
            <v-toolbar dark rounded class="rounded-xl">
              <v-spacer />
              <h1 class="header">
                ADD GYM
              </h1>
              <v-spacer />
            </v-toolbar>
            <form method="post">
              <v-row class="ma-6">
                <v-col md="4">
                  <v-text-field v-model="gym_name" label="Gym name" required @blur="$v.gym_name.$touch()" :error-messages="gym_nameErrors">
                  </v-text-field>
                </v-col>
                <v-col md="4">
                  <v-text-field v-model="price_per_month" label="Price per month" required @blur="$v.price_per_month.$touch()" :error-messages="price_per_monthErrors">
                  </v-text-field>
                </v-col>
                <v-col md="4">
                  <v-text-field v-model="location" label="location" required @blur="$v.location.$touch()" :error-messages="locationErrors">
                  </v-text-field>
                </v-col>
              </v-row>
              <v-row class="ma-6">
                <v-col>
                  <v-text-field v-model="working_hours" label="Working hours" required @blur="$v.working_hours.$touch()" :error-messages="working_hoursErrors">
                  </v-text-field>
                </v-col>
                
              </v-row>
              <v-row class="ma-6">
                <v-col>
                  <v-text-field type="url" v-model="gym_url" label="GYM URL" required
                    @blur="$v.gym_url.$touch()" :error-messages="gym_urlErrors">
                  </v-text-field>
                </v-col>
              </v-row>
              <v-row class="ma-6">
                <v-col>
                  <v-text-field type="number" v-model="rating" label="Rating" required
                    @blur="$v.rating.$touch()" :error-messages="ratingErrors">
                  </v-text-field>
                </v-col>
              </v-row>
              <v-row class="ma-8">
                <div>
                  <v-btn absolute rounded right dark class=" mt-n3 " @click="submit">
                    add gym +
                  </v-btn>
                </div>
              </v-row>
            </form>
          </v-card>
        </v-col>
        <v-spacer />
      </v-row>
    </div>
  </template>
  <script>
  import { validationMixin } from 'vuelidate'
  import { required,maxLength,numeric,alpha } from 'vuelidate/lib/validators'
  import axios from 'axios'
  export default {
    data: () => ({
      rating:'',
      gym_name: '',
      price_per_month: '',
      catgory: '',
      working_hours: '',
      gym_url: '',
  
    }),
    mixins: [validationMixin],
  
    validations: {
      rating:{ required, maxLength:maxLength(200)},
      gym_name: { required },
      price_per_month: { required,numeric },
      location: { required, alpha },
      working_hours: { required},
      gym_url:{required},
  
    },
  
    
  
    computed: {
      gym_nameErrors() {
        const errors = []
        if (!this.$v.gym_name.$dirty) return errors
        !this.$v.gym_name.required && errors.push('You must enter a gym name')
        return errors
      },
      price_per_monthErrors() {
        const errors = []
        if (!this.$v.price_per_month.$dirty) return errors
        !this.$v.price_per_month.required && errors.push('You must enter a price per month for the new gym')
        !this.$v.price_per_month.numeric && errors.push('price per month for the new gym must be numeric')
        return errors
      },
      locationErrors() {
        const errors = []
        if (!this.$v.location.$dirty) return errors
        !this.$v.location.alpha && errors.push('location must be a string')
        !this.$v.location.required && errors.push("location can't be empty")
        return errors
      },
      working_hoursErrors() {
        const errors = []
        if (!this.$v.working_hours.$dirty) return errors
        !this.$v.working_hours.required && errors.push("Working hours can't be empty")
        return errors
      },
     
      gym_urlErrors(){
        const errors = []
        if (!this.$v.gym_url.$dirty) return errors
        !this.$v.gym_url.required && errors.push('image url is required')
        return errors  
      },
      ratingErrors() {
        const errors = []
        if (!this.$v.rating.$dirty) return errors
        !this.$v.rating.required && errors.push("Rating")
        !this.$v.rating.numeric && errors.push("Rating for the new gym must be numeric")
        return errors
      }
    },
    methods: {
      submit() {
        this.$v.$touch();
        if(!this.gym_nameErrors.length && 
        !this.price_per_monthErrors.length &&
        !this.locationErrors.length &&
        !this.working_hoursErrors.length &&
        !this.gym_urlErrors.length &&
        !this.ratingErrors.length) {
          axios.post("http://localhost:5000/addGym" , {
            gym_name: this.gym_name,
            price_per_month: this.price_per_month,
            location: this.location,
            working_hours: this.working_hours,
            gym_url: this.gym_url,
            rating: this.rating
          }).then(res=>{
            if(res.data=="Gym added successfully"){
              this.$router.push('/admin');
            }
          }).catch(()=>{
            alert("Something Went Wrong");
          });
        }
      }
  }
  }
  </script>
  <style>
  .adminBackgroud {
    background-color: #582B9C;
    height:100%;
    width:100%;
  }
  </style>