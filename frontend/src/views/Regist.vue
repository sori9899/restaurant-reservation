
<template>
    <v-card
    class="mx-auto"
    max-width="400">

      <v-card-title>
        Select Regervation Date
      </v-card-title>

      <v-card-subtitle >
        Regerv Date: {{ strdate }}
      </v-card-subtitle>

      <v-card-item>
        <v-row justify="space-around">
        <v-date-picker 
          color="blue"
          v-model="regrvdate"
          elevation="1"
          lang="kor"
          @input="date => handleDate(date)"
          title="Reservation Date"
        ></v-date-picker>
      </v-row>
      </v-card-item>

      <v-card-text>

        Reservation Name
        <v-text-field
        v-model="reservname"
        :rules="rules"
        hide-details="auto"
        ></v-text-field>
        
        <br>
        Phone number
        <v-text-field
        v-model="phonenum"
        :rules="rules"
        single-line
        type="number"
        ></v-text-field>

        <br>
        Visit Member
        <v-text-field
        v-model="visitnum"
        single-line
        type="number"
        ></v-text-field>

        Menu Category
        <v-select
        v-model="value"
        :items="items"
        chips
        multiple
        ></v-select>
        
      </v-card-text>

          <v-btn value="Save">
            <span>Save</span>
          </v-btn>

          <v-btn 
          value="Delete"
          color="blue"
          
          >
            <span>Cancel</span>
          </v-btn>
      
    </v-card>
</template>

<script setup>
import {ref, onMounted} from 'vue';
import { createVuetify } from 'vuetify';
import Datepicker from '@vuepic/vue-datepicker';
import '@vuepic/vue-datepicker/dist/main.css';

const date = ref();



</script>

<script>
export default {
    data(){
      return{
        regrvdate: new Date(),
        strdate: new String(),
        reservname : new String(),
        phonenum : null,
        visitnum : 0, 
        items: ['foo', 'bar', 'fizz', 'buzz'],
        value: ['foo', 'bar', 'fizz', 'buzz'],
        rules: [
          value => !!value || 'Required',
          value => (value && value.length >= 3) || 'Min 3 characters'
        ],
        test:[

        ]
      };
    },
    methods:{
      handleDate(date){
        this.regrvdate = date;
        window.console.log(date);
      },
    },
    watch:{
      regrvdate(newDate){
        console.log(this.regrvdate.toString().substring(0,15))
        console.log(newDate);

        this.strdate = this.regrvdate.toString().substring(0,15);
      }
    }
}

</script>

<style scoped>


</style>
