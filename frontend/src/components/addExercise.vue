<template>
    <div class="adminBackgroud">
      <v-row>
        <v-spacer />
        <v-col md="8" class="my-16">
          <v-card round class="rounded-xl ma-16 pa-2" >
            <v-toolbar dark rounded class="rounded-xl">
              <v-spacer />
              <h1 class="header">
                ADD EXERCISE
              </h1>
              <v-spacer />
            </v-toolbar>
            <form method="post">
              <v-row class="ma-6">
                <v-col md="4">
                  <v-text-field v-model="exercise_name" label="Exercise name" required @blur="$v.exercise_name.$touch()" :error-messages="exercise_nameErrors">
                  </v-text-field>
                </v-col>
                <v-col md="4">
                  <v-text-field v-model="calories_per_set" label="Calories per set" required @blur="$v.calories_per_set.$touch()" :error-messages="calories_per_dayErrors">
                  </v-text-field>
                </v-col>
                <v-col md="4">
                  <v-text-field v-model="category" label="Category" required @blur="$v.category.$touch()" :error-messages="categoryErrors">
                  </v-text-field>
                </v-col>
              </v-row>
              <v-row class="ma-6">
                <v-col>
                  <v-text-field v-model="target_muscle" label="Target muscle" required @blur="$v.target_muscle.$touch()" :error-messages="target_muscleErrors">
                  </v-text-field>
                </v-col>
                
              </v-row>
              <v-row class="ma-6">
                <v-col>
                  <v-text-field type="image_url" v-model="image_url" label="Image URL" required
                    @blur="$v.image_url.$touch()" :error-messages="image_urlErrors">
                  </v-text-field>
                </v-col>
              </v-row>
              <v-row class="ma-6">
                <v-col>
                  <v-text-field type="video_url" v-model="video_url" label="Video url" required
                    @blur="$v.video_url.$touch()" :error-messages="video_urlErrors">
                  </v-text-field>
                </v-col>
              </v-row>
              <v-row class="ma-8">
                <div>
                  <v-btn absolute rounded right dark class=" mt-n3 " @click="submit">
                    add exercise +
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
      video_url:'',
      exercise_name: '',
      calories_per_set: '',
      catgory: '',
      target_muscle: '',
      image_url: '',
  
    }),
    mixins: [validationMixin],
  
    validations: {
      video_url:{ required, maxLength:maxLength(200)},
      exercise_name: { required },
      calories_per_set: { required,numeric },
      category: { required, alpha },
      target_muscle: { required},
      image_url:{required},
  
    },
  
    
  
    computed: {
      exercise_nameErrors() {
        const errors = []
        if (!this.$v.exercise_name.$dirty) return errors
        !this.$v.exercise_name.required && errors.push('You must enter an exercise name')
        return errors
      },
      calories_per_setErrors() {
        const errors = []
        if (!this.$v.calories_per_set.$dirty) return errors
        !this.$v.calories_per_set.required && errors.push('You must enter a calories per set for the new exercise')
        !this.$v.calories_per_set.numeric && errors.push('Calories per set for the new exercise must be numeric')
        return errors
      },
      categoryErrors() {
        const errors = []
        if (!this.$v.category.$dirty) return errors
        !this.$v.category.alpha && errors.push('Category must be a string')
        !this.$v.category.required && errors.push("Category can't be empty")
        return errors
      },
      target_muscleErrors() {
        const errors = []
        if (!this.$v.target_muscle.$dirty) return errors
        !this.$v.target_muscle.required && errors.push("Target muscle can't be empty")
        return errors
      },
     
      image_urlErrors(){
        const errors = []
        if (!this.$v.image_url.$dirty) return errors
        !this.$v.image_url.required && errors.push('image url is required')
        return errors  
      },
      video_urlErrors() {
        const errors = []
        if (!this.$v.video_url.$dirty) return errors
        !this.$v.video_url.required && errors.push("Video URL can't be empty")
        !this.$v.video_url.maxLength && errors.push("Video URL can't be more than 200 character")
        return errors
      }
    },
    methods: {
      submit() {
        this.$v.$touch();
        if(!this.exercise_nameErrors.length && 
        !this.calories_per_setErrors.length &&
        !this.categoryErrors.length &&
        !this.target_muscleErrors.length &&
        !this.image_urlErrors.length &&
        !this.video_urlErrors.length) {
          axios.post("http://localhost:5000/addExercise" , {
            exercise_name: this.exercise_name,
            calories_per_day: this.calories_per_day,
            category: this.category,
            target_muscle: this.target_muscle,
            image_url: this.image_url,
            video_url: this.video_url
          }).then(res=>{
            if(res.data=="Car added successfully"){
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