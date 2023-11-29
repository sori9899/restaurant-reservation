<template>
  <search-toolbar mode="submit" @submit="submit"/>
  <v-container fluid>
    <v-row justify="center">
      <v-date-picker
        color="black"
        v-model="formData.date"
        width="90%"
        :min="beforeDate"
        locale="ko"
      ></v-date-picker>
    </v-row>
    <v-row>
      <v-sheet
        class="mx-auto"
        width="90%"
      >
        <v-slide-group
          show-arrows
          v-model="formData.timeOptionIndex"
        >
          <v-slide-group-item
            v-for="n in timeOptions"
            :key="applyToTimeString(n)"
            v-slot="{ isSelected, toggle }"
          >
            <v-btn
              class="ma-2"
              rounded
              :color="isSelected ? 'black' : undefined"
              @click="toggle"
            >
              {{ applyToTimeString(n) }}
            </v-btn>
          </v-slide-group-item>
        </v-slide-group>
      </v-sheet>
    </v-row>
    <v-row>
      <v-col cols="4">
        <v-list-subheader>음식 종류</v-list-subheader>
      </v-col>

      <v-col cols="8">
        <v-select
          label="음식 종류"
          v-model="formData.foodCategory"
          :items="foodCategories"
        ></v-select>
      </v-col>
    </v-row>

    <v-row>
      <v-col cols="4">
        <v-list-subheader>인원수</v-list-subheader>
      </v-col>

      <v-col cols="8">
        <v-text-field
          v-model="formData.numberOfPeople"
          suffix="명"
          type="number"
        ></v-text-field>
      </v-col>
    </v-row>

    <v-row>
      <v-col cols="4">
        <v-list-subheader>1인당 가격</v-list-subheader>
      </v-col>

      <v-col cols="8">
        <v-range-slider
          v-model="formData.price"
          max="100000"
          min="0"
          step="1000"
          thumb-label="always"
        ></v-range-slider>
      </v-col>
    </v-row>
  </v-container>
</template>

<script lang="ts">
import {defineComponent, ref} from "vue";
import SearchToolbar from "@/components/SearchToolbar.vue";
import {useRouter} from "vue-router";

const createTimeOptions = (startHour: number, startMinute: number): Date[] => {
  const time = new Date();
  time.setHours(startHour);
  time.setMinutes(startMinute);
  time.setSeconds(0);

  const times = [];
  for (let i = 0; i < 20; i++) {
    time.setMinutes(time.getMinutes() + 30);
    times.push(new Date(time));
  }

  return times;
}

const applyToTimeString = (time: Date) => time.toLocaleTimeString([], {hour: "numeric", minute: "numeric"});
const wrapper = (str: number) => String(str).padStart(2, '0');

const merge = (date: Date, time: Date) =>
  `${date.getFullYear()}-${wrapper(date.getMonth())}-${wrapper(date.getDay())} ${wrapper(time.getHours())}:${wrapper(time.getMinutes())}:00`;

const getBeforeDate = () => {
  const date = new Date();
  date.setDate(new Date().getDate() - 1)

  return date;
}

export default defineComponent({
  components: {SearchToolbar},
  setup: function () {
    const foodCategories = ['한식', '일식', '양식', '중식'];
    const timeOptions: Date[] = createTimeOptions(9, 0);

    const router = useRouter();
    const formData = ref({
      numberOfPeople: 0,
      price: [0, 100000],
      date: new Date(),
      foodCategory: null,
      timeOptionIndex: 0
    });

    const submit = () => router.push('/restaurants');

    return {
      foodCategories,
      timeOptions,
      formData,
      applyToTimeString,
      submit,
      beforeDate: getBeforeDate()
    }
  }
})
</script>
