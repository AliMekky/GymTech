<template>
    <div>
        <v-snackbar 
            top 
            timeout="3500" 
            v-model="isError" 
            color="error">
                Please select a routine in order to start it
        </v-snackbar>
        <v-card class="rounded-xl mb-3">
            <v-card-title>
                <p class="text-h4 text--primary"> Saved Workouts</p>
            </v-card-title>
            <v-row>
                <v-col>
                    <v-list shaped>
                        <v-list-item-group
                            v-model="selectedItem"
                            color="primary"
                        >
                            <v-list-item
                            v-for="(item, i) in workouts"
                            :key="i"
                            >
                            <p class="text-h6 text--secondary">{{ item }}</p>
                            </v-list-item>
                        </v-list-item-group>
                    </v-list>
                <v-row>
                    <v-col class="mx-3 ">
                        <v-btn
                            class="primary rounded-lg"
                            @click="startRoutine">
                            Start workout
                        </v-btn>
                    </v-col>
                </v-row>
                </v-col>
                <v-col>
                    <p class="text-h5 text--primary">Wanna try a new workout?</p>
                    <v-btn
                        @click="newRoutine"
                        class="primary rounded-lg">
                        Add now
                    </v-btn>
                </v-col>
            </v-row>
        </v-card>
    </div>
</template>
<script>
export default {
    data:()=>({
        selectedItem:-1,
        isError:false
        }),
    props:['workouts'],

    methods:{
        startRoutine(){
            if(this.selectedItem==-1){
                this.isError=true
            }else{
                this.$cookies.set("selectedWorkout",this.workouts[this.selectedItem],0)
                this.$router.push("/startWorkout")
        
            }
        },
        newRoutine(){
            this.$router.push("/addWorkout")
        }
    }
}
</script>