<template>
    <v-row justify="center">
      <v-dialog
      v-model="dialog"
        persistent
        max-width="600px"
        
      >
        <v-card
        height="260px">
          <v-card-title>
            <span class="text-h5">User Profile</span>
          </v-card-title>
          <v-container>
            <v-row>
                <v-col
                class="mx-3">
                    <p class="text-h5 text--secondary">Congratulations on completing your workout</p>
                    <p class="text-h5 text--secondary">Your training volume is {{ volume }}</p>
                </v-col>
            </v-row>
            <v-row>
            <v-btn absolute right class="rounded-xl primary" @click="reroute()"> Go back to dashboard</v-btn>
        </v-row>
        </v-container>
        </v-card>
      </v-dialog>
    </v-row>
  </template>
  <script>
export default{
    data:()=>({
        dialog:true
    }),
    props:['volume'],
    methods:{
        reroute(){
            this.$router.push('/dashboard')
        }
    }
}
</script>
  