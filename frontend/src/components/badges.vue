<template>
    <div>
      <div v-for="(item, i) in badges" :key="i">
        <v-row>
          <v-col md="2">
            <v-img height="100" width="100" :src="item.src" class="rounded-xl"></v-img>
          </v-col>
          <v-col class="mt-4">
            <p>{{ item.name }}, {{ item.desc }}</p>
          </v-col>
        </v-row>
      </div>
    </div>
  </template>
  
  <script>
  import { mapGetters } from 'vuex';
  
  export default {
    data: () => ({
      badges: []
    }),
    props: {
        frequencies: {
        type: Array,
        default: () => []
        },
    },
  
    computed: {
      ...mapGetters(['getBadges']),
    },
  
    watch: {
      frequencies() {
        let today = new Date();
        let index = today.getMonth() ;
        let monthFrequency = this.frequencies[index]
        console.log(monthFrequency)
        //monthFrequency = 18;
        if (monthFrequency >= 10) {
          this.badges.push(this.getBadges[0]);
        }
        if (monthFrequency >= 20) {
          this.badges.push(this.getBadges[1]);
        }
      }
    }
  };
  </script>
  