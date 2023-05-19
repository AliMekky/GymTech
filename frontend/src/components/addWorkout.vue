<template>
    <div class="background">
        <v-snackbar 
            top 
            timeout="3500" 
            v-model="invalid" 
            color="error">
                You must enter a workout name
        </v-snackbar>
        <v-snackbar 
            top 
            timeout="3500" 
            v-model="invalidKeys" 
            color="error">
                You must select some exercise to save as a workout
        </v-snackbar>
        <v-row>
            <v-spacer/>
            <v-col md="6">
                <v-card
                    class="mx-auto mt-16 rounded-xl">
                    <v-row
                    class="mx-3">
                        <v-col 
                            md="6"
                            >
                            <v-text-field
                            label="workout name"
                            v-model="workout_name">
                                
                            </v-text-field>
                        </v-col>
                    </v-row>
                    <v-list-item
                        v-for="(item, i) in exercises"
                        :key="i">
                        <v-row>
                            <v-col
                            md="3">
                        <v-checkbox
                            @click="addIndex(i)"
                            :label=item.name>
                        </v-checkbox>
                    </v-col>
                    <v-col
                    md="3">
                        <p class="mt-4">Category: {{item.category}}</p>
                    </v-col>
                    <v-col
                    md="3">
                        <p class="mt-4">{{item.target_muscle}}</p>
                    </v-col>
                    <v-col
                    md="3">
                    <v-img
                        height="100"
                        width="100"
                        :src="item.image_url"
                        class="rounded-xl point"
                        @click="redirectToVideo(item.video_link)"
                    ></v-img>
                    </v-col>
                    </v-row>
                    </v-list-item>
                    <v-row>
                        <v-spacer/>
                        <v-col
                            md="4">
                            <v-btn
                                @click="save"
                                class="rounded-xl primary"
                                >
                                Save workout
                            </v-btn>
                        </v-col>
                    </v-row>
                </v-card>
            </v-col>
            <v-spacer/>
        </v-row>
    </div>
</template>
<script>
import axios from 'axios';
export default{
    data:()=>({
        exercises:[],
        keys:[],
        workout_name:'',
        invalid:false,
        invalidKeys:false
    }),
    methods:{
        addIndex(key){
            if(!this.keys.includes(key)){
                this.keys.push(key)
            }else{
                this.keys.splice(this.keys.indexOf(key),1)
            }
        },
        redirectToVideo(videoUrl) {
            window.location.href = videoUrl;
        },
        save(){
            if(!this.workout_name){
                this.invalid=true
            }else if(this.keys.length==0){
                this.invalidKeys=true
            }else{
                for(let i=0;i<this.keys.length;i++){
                    this.keys[i]+=1;
                }
                axios.post("http://localhost:5000/addWorkout",{
                    keys:this.keys,
                    workout_name:this.workout_name,
                    email:this.$cookies.get("user").email
                }).then(res=>{
                    console.log(res)
            }).catch(()=>{
                alert("Something went wrong")
            })
                this.$router.push("/dashboard")
            }
            
        }

    },
    created(){
        axios.get("http://localhost:5000/exercises").then(res=>{
            const data=res.data;
            for(let key in data){
                console.log(data[key])
                this.exercises.push(data[key])
            }
        }).catch(()=>{
            alert("Something Went Wrong");
        })

    }
}
</script>
<style scoped>
.point{
    cursor: pointer;
}
.background{
    background-color: #F6F1F1;
    height: 100%;
}
</style>