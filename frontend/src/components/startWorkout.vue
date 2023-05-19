<template>
    <div class="background">
        <v-snackbar 
              top 
              timeout="3500" 
              v-model="isAlpha" 
              color="error">
                  Weights and Reps must be numeric, check for typos? hint: don't leave empty fields
          </v-snackbar>
          <popup v-if="finished" :volume="volume"></popup>
        <v-row>
            <v-spacer/>
            <v-col
                md="10">
                <v-card
                    class="mt-5 rounded-xl">
                    <v-card-title>
                        {{ this.workout_name }}
                        <v-spacer/>
                        <stopwatch
                            v-show="isStarted || isFinished"
                            ref="stopWatch"
                            class="digits"
                            :hours=false
                            minutes
                            />
                    </v-card-title>
                    <v-card
                        md="5"
                        v-for="(item, index) in exNames" :key="index">
                        <v-row
                        class="mb-n16">
                            <v-col md="5">
                                <p class="text-h6 text--secondary mx-2">{{ item }}</p>
                            </v-col>
                            <v-spacer/>
                            <v-col md="2">
                                
                        <v-img
                            height="80"
                            width="80"
                            class="rounded-Xl"
                            :src="image_urls[index]"
                            ></v-img>
                        </v-col>
                        </v-row>
                        <v-row
                        class="mx-2"
                        v-for="(i) in 3" :key="i">
                        <p class="text-h6 text--primary mt-7"> Set {{ i }}</p>
                            <v-col
                            class="mx-10"
                                md="2">
                                <v-text-field label="weight"
                                    v-model="weights[i-1][index]"
                                    ></v-text-field>
                        </v-col>
                            <v-col
                            class="mx-10"
                                md="2">
                                <v-text-field label="reps"
                                v-model="reps[i-1][index]"
                                ></v-text-field>
                            </v-col>
                        </v-row>
                    </v-card>
                    <v-btn
                    right
                    absolute
                    class="rounded-xl primary mt-n8"
                    @click="finishWorkout()">Finish workout</v-btn>
                </v-card>
            </v-col>
            <v-spacer/>
        </v-row>
    </div>
</template>
<script>
import stopwatch from './stopwatch.vue'
import axios from 'axios';
import { validationMixin } from 'vuelidate'
import { required, numeric} from 'vuelidate/lib/validators'
import popup from './popup.vue'
export default{
    data:()=>({
        isStarted:true,
        image_urls:[],
        workout_name:'',
        exNames:[],
        exIds:[],
        weights:[[''],[''],['']],
        reps:[[''],[''],['']],
        isAlpha:false,
        finished:false,
        volume:0
    }),
    components:{
        stopwatch,
        popup
    },
    mixins: [validationMixin],
    validations: {
        reps:{required,numeric},
        weights:{required,numeric},
    },
    computed:{
},
    methods: {
        isNumericArray(arr) {
            return arr.every((val) => !isNaN(val));
            },
        finishWorkout(){
            let workout=[]
            this.volume=0;
            for(let i=0;i<this.exIds.length;i++){
                let exWeights=[]
                let exReps=[]
                for(let j=0;j<3;j++){
                    this.volume=this.volume+(this.weights[j][i]*this.reps[j][i])
                    exWeights.push(this.weights[j][i])
                    exReps.push(this.reps[j][i])
                }
                if(!this.isNumericArray(exWeights) || !this.isNumericArray(exReps)){
                    this.isAlpha=true
                }
                let obj={ex_id:this.exIds[i],
                    ex_weghts:exWeights,
                    ex_reps:exReps
                }
                workout.push(obj)

            }
            var currentDate = new Date().toJSON().slice(0, 10);   
            if(!this.isAlpha){
                axios.post("http://localhost:5000/finishWorkout",{
                workout:workout,
                date:currentDate,
                email:this.$cookies.get("user").email,
                workout_name:this.workout_name
            }).then(res=>{
                console.log(res)
                }).catch(()=>{
                    alert("Something Went Wrong");
                });
                this.finished=true;
            }
                }
  },
  created(){
    axios.post("http://localhost:5000/startWorkout",{
            email: this.$cookies.get("user").email,
            workout_name:this.$cookies.get("selectedWorkout")
        }).then(res=>{
            const data=res.data;
            for(let key in data){
                this.exIds.push(data[key].ex_id)
                this.image_urls.push(data[key].image_url)
                this.exNames.push(data[key].name)
                this.workout_name=this.$cookies.get("selectedWorkout")
            }
            console.log(this.weights)
        }).catch(()=>{
            alert("Something Went Wrong");
        });
  }
}
</script>
<style scoped>
.background{
    background-color: #F6F1F1;
    height: 100%;
}
</style>