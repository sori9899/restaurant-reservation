
<template>
  <v-container>
    <v-card
    class="mx-auto"
    max-width="920"
    min-width="400">

      <v-card-title class="title">
        Rastaurant Regervation
      </v-card-title>

      <v-card-subtitle class="title btm">
        {{ RsturantName }} / Tel.{{ RsturantTel }}
      </v-card-subtitle>

      <div class="Box">
        <v-card-text class="datepicker">
          <v-row justify="space-around" class="pt-4">
            <v-date-picker 
              color="blue"
              v-model="regrvdate"
              elevation="1"
              @input="date => handleDate(date)"
              title="Reservation Date"
            ></v-date-picker>
          </v-row>
        </v-card-text>

      <v-card-text>
        Select Visit Time
        <v-row>
          <!-- AM/PM Selector -->
          <v-col>
            <v-select
              v-model="ampm"
              :items="['AM', 'PM']"
              label="AM/PM"
            ></v-select>
          </v-col>

          <!-- Hour Selector -->
          <v-col>
            <v-select
              v-model="selectedHour"
              :items="Array.from({ length: 8 }, (_, i) => i + 10)"
              label="Hour"
            ></v-select>
          </v-col>

          <!-- Minute Selector -->
          <v-col>
            <v-select
              v-model="selectedMinute"
              :items="Array.from({ length: 60 }, (_, i) => i)"
              label="Minute"
            ></v-select>
          </v-col>
        </v-row>

        Reservation Name
        <v-text-field
        v-model="reservname"
        :rules="rules"
        single-line
        ></v-text-field>
        
        Phone number
        <v-text-field
        v-model="phonenum"
        :rules="rules"
        single-line
        type="number"
        ></v-text-field>

        Visit Member
        <v-text-field
        v-model="visitnum"
        single-line
        type="number"
        ></v-text-field>

        Select Course
        <v-select
          v-model="select"
          :hint="`${select.course}, ${select.menu}`"
          :items="items"
          item-title="course"
          item-value="menu"
          label="Select"
          persistent-hint
          return-object
          single-line
        ></v-select>

        Requested
        <v-textarea
        clearable
        clear-icon="mdi-close-circle"
        v-model="request"
        variant="filled"
        auto-grow
        rows="4"
        row-height="30"
        shaped
        ></v-textarea>
        
      </v-card-text>

      </div>
      
    
      <v-card-item>
        <div class="d-flex justify-end">

          <v-btn 
          value="Delete"
          color="blue-lighten-2"
          variant="text"
          @click="MoveBack()"
          >
            <span>Cancel</span>
          </v-btn>

          <v-btn 
          value="Save"
          color="blue-lighten-2"
          variant="text"
          @click="Save()"
          >
            <span>Save</span>
          </v-btn>

        </div>
      </v-card-item>
    </v-card>
  </v-container>
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
        RsturantName : "Ban Yu-hyun Restaurant: THE RED",
        RsturantTel : "043.261.3321",
        regrvdate: new Date(),
        strdate: null,
        reservname : null,
        request: null,
        phonenum : null,
        visitnum : 0, 
        rules: [
          value => !!value || 'Required'
        ],
        select: { course: 'None', menu: 'later decision' },
        items: [
          { course: 'A Course', menu: 'Cream_Pasta, Soup, Bread, Steak, Wine' },
          { course: 'B Course', menu: 'Chicken, Pizza, Snacks, Beer' },
          { course: 'C Course', menu: 'Pork_belly, Soju, Steamed_eggs, Sold_noodles' },
          { course: 'D Course', menu: 'Sushi, Rice_wine, Udon, Rolls' },
        ],
        ampm: 'AM',
        selectedHour: 10,
        selectedMinute: 0,
      };
    },
    methods:{
      handleDate(date){
        this.regrvdate = date;
        window.console.log(date);
      },
      MoveBack(){
        console.log("cancel")
        this.$router.push({path:"/"})
      },
      Save(){

        const minute = this.selectedMinute < 10 ? '0' + this.selectedMinute : this.selectedMinute
        const course = JSON.stringify(this.select);
        console.log(this.strdate+"_" + this.ampm+"."+this.selectedHour+"."+minute+ "_"+ this.reservname + "_"+ this.phonenum + "_"+ this.visitnum+"_"+this.request)
        console.log(course)

        if(this.reservname && this.phonenum && this.visitnum >0){
          console.log("save!!")
        }
      },
    },
    watch:{
      regrvdate(newDate){
        console.log(this.regrvdate)
        console.log(newDate);

        const year = this.regrvdate.getFullYear();
        const month = (this.regrvdate.getMonth() + 1).toString().padStart(2, '0');
        const day = this.regrvdate.getDate().toString().padStart(2, '0');

        console.log(`${year}.${month}.${day}`);

        this.strdate = `${year}.${month}.${day}`;
      }
    },
    mounted(){
        const today = new Date();

        const year = this.regrvdate.getFullYear();
        const month = (this.regrvdate.getMonth() + 1).toString().padStart(2, '0');
        const day = this.regrvdate.getDate().toString().padStart(2, '0');

        console.log(today)
        console.log(`${year}.${month}.${day}`)

        this.strdate = `${year}.${month}.${day}`;
    }
}

</script>

<style scoped>

.Box{
  display: flex;
  flex-wrap: wrap;
  flex-direction: row;
}


.title{
  text-align: center;
}

.btm{
  margin-bottom: 20px;
}
</style>