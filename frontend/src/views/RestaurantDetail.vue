<template>
  <v-app width="100%">
  <v-card
    :loading="loading"
    class="mx-auto"
    width="100%"
  >
    <template v-slot:loader="{ isActive }">
      <v-progress-linear
        :active="isActive"
        color="deep-purple"
        height="4"
        indeterminate
      ></v-progress-linear>
    </template>

    <v-img
      cover
      height="300"
      src="https://cdn.vuetifyjs.com/images/cards/cooking.png"
    >
      <v-toolbar
        color="rgba(0, 0, 0, 0)"
        theme="dark"
      >
        <template v-slot:prepend>
          <v-btn icon="mdi-arrow-left"></v-btn>
        </template>
      </v-toolbar>
    </v-img>

    <v-card>
      <v-card-item>
        <v-card-title class="font-weight-bold">{{restaurant.name}}</v-card-title>
      </v-card-item>

      <v-card-text>
        <div>{{restaurant.description}}</div>
      </v-card-text>
    </v-card>

    <v-divider class="mx-4 mb-1"></v-divider>

    <v-card-title class="font-weight-bold">예약 시간</v-card-title>

    <div class="px-4 d-flex flex-wrap">
      <v-chip-group v-for="index in availableTime" :key="index" v-model="selection">
        <v-chip :class="{ 'bg-red-lighten-1': index.seat > 0 }">
          {{ index.time }} - {{ index.seat }}
        </v-chip>
      </v-chip-group>
    </div>

    <v-divider class="mx-4 mb-1"></v-divider>

    <v-card-title class="font-weight-bold">메뉴</v-card-title>
    <v-list>
      <v-list-item v-for="(item, index) in menuItems" :key="index">
        <v-list-item-content class="d-flex justify-space-between w-100">
          <div>
            <v-list-item-title>{{ item.menu }}</v-list-item-title>
          </div>
          <div>
            <v-list-item-subtitle>{{ item.price }}</v-list-item-subtitle>
          </div>
        </v-list-item-content>
      </v-list-item>
    </v-list>

    <v-divider class="mx-4 mb-1"></v-divider>

    <v-card-title class="font-weight-bold">식당 위치</v-card-title>
    <GoogleMap style="height: 300px;"/>
  </v-card>
    <v-bottom-navigation class="bg-transparent">
      <v-btn
        class="bg-red-lighten-1 mx-auto white--text w-100 rounded-xl"
        @click="reserve"
      >
        예약하기
      </v-btn>
    </v-bottom-navigation>
  </v-app>
</template>


<script>
import GoogleMap from "@/components/GoogleMap.vue";
import {defineComponent} from "vue";

export default defineComponent({
  components: {GoogleMap},
  methods: {
    reserve() {
      // 예약 버튼 클릭 시 실행할 동작 정의
    }
  },
  data() {
    return {
      restaurant: {name: '오마카세어진', description: '다양한 안주와 스시를 즐길 수 있는 술이 맛있는 공간'}
      ,
      menuItems: [
        { menu: '런치 오마카세', price: '45,000원' },
        { menu: '디너 오마카세', price: '55,000원' },
      ],
      availableTime: [
        {time: '5:30 PM', seat: 0},
        {time: '7:00 PM', seat: 2},
        {time: '7:30 PM', seat: 0},
        {time: '8:00 PM', seat: 0},
      ],
    };
  }
})

</script>

<style scoped>

</style>
