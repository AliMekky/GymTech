<template>
    <PolarArea
      :chart-options="chartOptions"
      :chart-data="chartData"
      :chart-id="chartId"
      :dataset-id-key="datasetIdKey"
      :plugins="plugins"
      :css-classes="cssClasses"
      :styles="styles"
      :width="width"
      :height="height"
    />
  </template>
  
  <script>
  import { PolarArea } from 'vue-chartjs/legacy'
  
  import {
    Chart as ChartJS,
    Title,
    Tooltip,
    Legend,
    ArcElement,
    RadialLinearScale
  } from 'chart.js'
  
  ChartJS.register(Title, Tooltip, Legend, ArcElement, RadialLinearScale)
  
  export default {
    name: 'PolarAreaChart',
    components: {
      PolarArea
    },
    props: {
      volumes: {
        type: Array,
        default: () => []
      },
      chartId: {
        type: String,
        default: 'polar-chart'
      },
      datasetIdKey: {
        type: String,
        default: 'label'
      },
      width: {
        type: Number,
        default: 400
      },
      height: {
        type: Number,
        default: 400
      },
      cssClasses: {
        default: '',
        type: String
      },
      styles: {
        type: Object,
        default: () => {}
      },
      plugins: {
        type: Array,
        default: () => []
      }
    },
    data() {
      return {
        chartData: {
          labels: [
            'Workout 1',
            'Workout 2',
            'Workout 3',
            'Workout 4',
            'Workout 5',
            'Workout 6',
            'Workout 7'
          ],
          datasets: [
            {
              label: 'Week 1',
              //backgroundColor: 'rgba(179,181,198,0.2)',
              pointBackgroundColor: 'rgba(179,181,198,1)',
              pointBorderColor: '#fff',
              pointHoverBackgroundColor: '#fff',
              pointHoverBorderColor: 'rgba(179,181,198,1)',
              data: [],
              backgroundColor: [
                'rgba(255, 99, 132,0.4)',
                'rgba(75, 192, 192, 0.4)',
                'rgba(255, 205, 86, 0.4)',
                'rgba(201, 203, 207, 0.4)',
                'rgba(54, 162, 235, 0.4)',
                'rgba(179,181,198,0.4)'
              ]
            }
            
          ]
        },
        chartOptions: {
          responsive: true,
          maintainAspectRatio: false
        }
      }
    },
        watch: {
          volumes(){
            this.chartData.datasets[0].data = this.volumes
          }
        }
  }
  </script>
  