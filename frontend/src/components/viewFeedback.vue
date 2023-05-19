<template>
    <div class="background">
        <v-data-table
      dense
      dark
    :headers="feedbackHeaders"
    :items="searchResults"
    :search="search"
    item-key="name"
    class="elevation-1 mt-16 mx-3 rounded-xl"
  >
    <template v-slot:top>
      <v-toolbar flat>
        <v-toolbar-title>Feedback</v-toolbar-title>
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
        feedbackHeaders: [ 
        { text: 'First name', value: 'fname', sortable:true, align: 'start' ,width: "150px"},
        { text: 'Last name', value: 'lname', sortable:true, align: 'start' ,width: "150px"},
        { text: 'Date', value: 'date', align: 'start' ,width: "150px"},
        {text:'Review', value:'recommendation', align:'start', width: "150px"}

    ]}
    ),
    created(){
     this.searchResults=[]
     axios.get("http://localhost:5000/getFeedbacks").then(res=>{
       const data=res.data;
       for(let key in data){
        data[key].date=new Date(data[key].date).toJSON().slice(0, 10); 
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