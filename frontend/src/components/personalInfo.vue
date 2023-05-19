<template>
    <v-card class="rounded-xl">
        <v-card-title>
            <p class="text-h4 text--primary"> Personal info</p>
        </v-card-title>
        <v-card-text>
            <v-row>
                <v-col
                    md="6">                
                        <p class="text-h5 text--primary">Welcome {{this.user_info.fname}}</p>
                        <p class="text-h6 text--secondary">Your height is {{this.user_info.height}}</p>
                        <p class="text-h6 text--secondary">Your weight is {{this.user_info.weight}}</p>
                        <p class="text-h6 text--secondary">Suggested goal is to {{(this.user_info.weight-this.user_info.target_weight).toFixed(2)}}</p>
                </v-col>
                <v-col
                    md="6">
                        <v-btn 
                            class="primary rounded-lg"
                            @click="redirectGym()">
                            View nearby gyms
                        </v-btn>
                        <v-row
                            class="mx-2">
                            <v-btn 
                            class="primary rounded-lg mt-6"
                            @click="redirectFeedback()">
                            Add Feedback
                        </v-btn>
                        </v-row>
                        
                        
                </v-col>
            </v-row>
        </v-card-text>
    </v-card>
</template>
<script>
    export default{
        data:()=>({
            goal:0,

        }),
        props :[
        'user_info',
    ],
        methods:{
            redirectGym(){
                this.$router.push('/gyms')
            },
            redirectFeedback(){
                this.$router.push('/feedback')
            }
        }
    }
</script>
<style>
.card{
    color: aqua;
}
</style>