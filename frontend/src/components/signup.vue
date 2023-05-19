<template>
    <div class="background">
      <v-snackbar 
              top 
              timeout="3500" 
              v-model="emailExists" 
              color="error">
                  Email already exists, do you want to sign in instead?
          </v-snackbar>
      <v-row>
        <v-spacer/>
          <v-col
            md="8"
            class="my-16">
            <v-card 
              round 
              class="rounded-xl ma-16 pa-2"
              :height="this.$vuetify.breakpoint.height*0.8"
              >
              <v-toolbar 
                rounded 
                class="toolBar rounded-xl">
                <v-spacer />
                <h1 class="header">
                  REGISTER
                </h1>
                <v-spacer />
                </v-toolbar>
                <form>
                  <v-row class="ma-6">
                    <v-col
                      md="3">
                        <v-text-field 
                          v-model="fname" 
                          :error-messages="fNameErrors" 
                          label="First name" 
                          required
                          @blur="$v.fname.$touch()">
                      </v-text-field>
                    </v-col>
                    <v-col
                      md="3">
                        <v-text-field 
                          v-model="lname" 
                          :error-messages="lNameErrors" 
                          label="Last name" 
                          required
                          @blur="$v.lname.$touch()">
                        </v-text-field>
                    </v-col>
                    <v-col>
                      <v-text-field 
                        v-model="email" 
                        :error-messages="emailErrors" 
                        label="E-mail" 
                        required
                        @blur="$v.email.$touch()">
                      </v-text-field>
                    </v-col>
                  </v-row>
                  <v-row class="ma-6">
                    <v-col>
                      <v-text-field type="password"
                        v-model="password"
                        :error-messages="passwordErrors" 
                        label="Password" 
                        required
                        @blur="$v.password.$touch()">
                      </v-text-field>
                    </v-col>
                    <v-col>
                      <v-text-field type="password"
                        v-model="confirmPassword"
                        :error-messages="conPasswordErrors" 
                        label="Confirm Password" 
                        required
                        @blur="$v.confirmPassword.$touch()">
                      </v-text-field>
                    </v-col>
                  </v-row>
  
                  <v-row class="ma-6">
                    <v-col>
                      <v-select 
                        v-model="select" 
                        :items="gender" 
                        clearable
                        :error-messages="selectErrors" 
                        label="Gender" 
                        required
                        @blur="$v.select.$touch()">
                      </v-select>
                    </v-col>
  
                    <v-col>
                        <v-text-field 
                          v-model="age" 
                          :error-messages="ageErrors" 
                          label="Age" 
                          required
                          @blur="$v.age.$touch()">
                      </v-text-field>
                    </v-col>
                  </v-row>
                  <v-row class="ma-6">
                    <v-col>
                        <v-text-field 
                          v-model="height" 
                          :error-messages="heightErrors" 
                          label="Height in cm" 
                          required
                          @blur="$v.height.$touch()">
                      </v-text-field>
                    </v-col>
  
                    <v-col>
                        <v-text-field 
                          v-model="weight" 
                          :error-messages="weightErrors" 
                          label="weight in Kg" 
                          required
                          @blur="$v.weight.$touch()">
                      </v-text-field>
                    </v-col>
                  </v-row>
                  <v-row class="ma-2">
                    <v-checkbox  
                      class="ml-7"
                      v-model="checkbox" 
                      :error-messages="checkboxErrors"
                      label="Agree on terms and conditions" 
                      required @change="$v.checkbox.$touch()"
                      @blur="$v.checkbox.$touch()">
                    </v-checkbox>
                    <div>
                      <v-btn 
                        absolute 
                        rounded
                        right 
                        color="black" 
                        dark 
                        class="mr-10 mt-5" 
                        @click="submit">
                          sign up
                      </v-btn>
                  </div>
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
  import { required, maxLength, email,minLength,sameAs,numeric} from 'vuelidate/lib/validators'
  import { subYears } from 'date-fns';
  import axios from 'axios';
  const instance = axios.create({
      withCredentials: true
  });
  export default {
    data: () => ({
      fname: '',
      lname: '',
      email: '',
      select: null,
      selectedGender:'',
      password:'',
      confirmPassword:'',
      gender: [
        'Male',
        'Female',
      ],
      age:'',
      height:'',
      weight:'',
      checkbox: false,
      emailExists:false
  
    }),
    mixins: [validationMixin],
  
    validations: {
        age:{required,numeric},
        height:{required,numeric},
        weight:{required,numeric},
        fname: { required, maxLength: maxLength(10) },
        lname: { required, maxLength: maxLength(10) },
        email: { required, email },
        select: { required },
        dob: {required ,minValue(val) {
            return new Date(val) < subYears(new Date(),18);
        },},
        password: { required,minLength: minLength(8)},
        confirmPassword: {required,sameAs:sameAs(vm=>{
            return vm.password;
        }
        )},
        checkbox: {
            checked(val) {
            return val
            },
        },
      
    },
  
    
  
    computed: {
      checkboxErrors() {
        const errors = []
        if (!this.$v.checkbox.$dirty) return errors
        !this.$v.checkbox.checked && errors.push('You must agree to continue!')
        return errors
      },
      selectErrors() {
        const errors = []
        if (!this.$v.select.$dirty) return errors
        !this.$v.select.required && errors.push('Gender is required')
        return errors
      },
      fNameErrors() {
        const errors = []
        if (!this.$v.fname.$dirty) return errors
        !this.$v.fname.maxLength && errors.push('Name must be at most 10 characters long')
        !this.$v.fname.required && errors.push('Name is required.')
        return errors
      },
      lNameErrors() {
        const errors = []
        if (!this.$v.lname.$dirty) return errors
        !this.$v.lname.maxLength && errors.push('Name must be at most 10 characters long')
        !this.$v.lname.required && errors.push('Name is required.')
        return errors
      },
      emailErrors() {
        const errors = []
        if (!this.$v.email.$dirty) return errors
        !this.$v.email.email && errors.push('Must be valid e-mail')
        !this.$v.email.required && errors.push('E-mail is required')
        return errors
      },
      passwordErrors(){
        const errors = []
        if (!this.$v.password.$dirty) return errors
        !this.$v.password.minLength && errors.push('Must be a valid password')
        !this.$v.password.required && errors.push('Password is required')
        return errors  
      },
      conPasswordErrors(){
        const errors = []
        if (!this.$v.confirmPassword.$dirty) return errors
        !this.$v.confirmPassword.required && errors.push('This field can not be empty')
        !this.$v.confirmPassword.sameAs && errors.push('Confirmation Password must match password')
        return errors  
      },
      ageErrors(){
        const errors = []
        if (!this.$v.age.$dirty) return errors
        !this.$v.age.required && errors.push('Age can not be empty')
        !this.$v.age.numeric && errors.push('Age must be a number')
        return errors  
      },
      heightErrors(){
        const errors = []
        if (!this.$v.height.$dirty) return errors
        !this.$v.height.required && errors.push('height can not be empty')
        !this.$v.height.numeric && errors.push('height must be a number')
        return errors  
      },
      weightErrors(){
        const errors = []
        if (!this.$v.weight.$dirty) return errors
        !this.$v.weight.required && errors.push('weight can not be empty')
        !this.$v.weight.numeric && errors.push('weight must be a number')
        return errors  
      }
    },
  
    methods: {
      async submit() {
        this.$v.$touch();
        if(!this.fNameErrors.length && !this.lNameErrors.length && !this.ageErrors.length && !this.emailErrors.length && !this.selectErrors.length && !this.checkboxErrors.length && !this.passwordErrors.length && !this.conPasswordErrors.length  && !this.weightErrors.length && !this.heightErrors.length){
          if(this.select=="Male"){
            this.selectedGender='M';
          }else{
            this.selectedGender='F';
          }
          
          await instance.post("http://localhost:5000/signup", {
            fname: this.fname,
            lname: this.lname,
            email: this.email,
            password: this.password,
            gender:this.selectedGender,
            age: this.age,
            height:this.height,
            weight:this.weight
          }).then(res=>{
            if(res.data=="Success"){ 
              let user={
                email: this.email,
                fname: this.fname,
                lname: this.lname,
                }
                console.log(user)
              this.$cookies.set("user",user,0);
              //this.$store.dispatch('setAuthenticated')
              //this.$store.dispatch('modifyLoggedInUser',user);
              this.$router.replace('/dashboard');
            }
            else if(res.data=="Email exists"){
              this.emailExists=true;
            }
          }).catch(()=>{
            alert("Something Went Wrong, unable to get a response from the server");
          });
      }
      },
      clear() {
        this.$v.$reset()
        this.name = ''
        this.email = ''
        this.select = null
        this.checkbox = false
      },
    },
  }
  </script>
  <style scoped>
  .v-menu__content{
      top: 160px!important; 
  }
  
  .background {
    background-color: #20262E;
    height:100%;
  }
  .toolBar {
    background-color: lightgray;
  }
  
  .header {
    text-align: center;
  }
  
  </style>