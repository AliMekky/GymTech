<template>
    <div class="background">
        <v-data-table
      dense
      dark
    :headers="gymHeaders"
    :items="searchResults"
    :search="search"
    item-key="name"
    class="elevation-1 mt-16 mx-3 rounded-xl"
  >
    <template v-slot:top>
      <v-toolbar flat>
        <v-toolbar-title>Gym</v-toolbar-title>
        <v-spacer></v-spacer>
      </v-toolbar>
    </template>
    <template v-slot:expanded-item="{ headers, item }">
      <td :colspan="headers.length">
        More info about {{ item.name }}
      </td>
    </template>
  </v-data-table>
    </div>

</template>

<script>
import axios from 'axios';
export default {
    data: () => ({
    search:'',
    searchResults:[],
    expanded: [],
        singleExpand: false,
        gymHeaders: [ 
        { text: 'Name', value: 'name', sortable:true, align: 'start' ,width: "150px"},
        { text: 'Location', value: 'location', sortable:true, align: 'start' ,width: "150px"},
        { text: 'Price/month', value: 'price/month', align: 'start' ,width: "150px"},
        {text:'Rating', value:'rating', align:'start', width: "150px"},
        {text:'Link', value:'link', align:'start', width: "150px"},
        {text:'Working Hours', value:'working_hours', align:'start', width: "150px"}

    ]}
    ),
    created(){
     this.searchResults=[]
     axios.get("http://localhost:5000/getGyms").then(res=>{
       const data=res.data;
       for(let key in data){
        this.searchResults.push(data[key]);   
     }
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