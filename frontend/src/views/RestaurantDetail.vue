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
      :src=restaurants.photo
    >
      <v-toolbar
        color="rgba(0, 0, 0, 0)"
        theme="dark"
      >
        <v-btn icon @click="$router.go(-1)">
          <v-icon>mdi-arrow-left</v-icon>
        </v-btn>
      </v-toolbar>
    </v-img>

    <v-card>
      <v-card-item>
        <v-card-title class="font-weight-bold">{{restaurants.name}}</v-card-title>
      </v-card-item>

      <v-card-text>
        <div>{{restaurants.description}}</div>
      </v-card-text>
    </v-card>

    <v-divider class="mx-4 mb-1"></v-divider>

    <v-card-title class="font-weight-bold">예약 시간</v-card-title>

    <div class="px-4 d-flex flex-wrap">
      <v-chip-group v-for="index in restaurants.availableTime" :key="index" v-model="selection">
        <v-chip class="bg-red-lighten-1">
          {{ index }}
        </v-chip>
      </v-chip-group>
    </div>

    <v-divider class="mx-4 mb-1"></v-divider>

    <v-card-title class="font-weight-bold">메뉴</v-card-title>
    <v-list>
      <v-list-item v-for="(item, index) in restaurants.menuItems" :key="index">
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
import restaurantData from "@/database/Restaurant.json";
import {useRoute, useRouter} from "vue-router";

export default defineComponent({
  components: { GoogleMap },

  setup(props) {
    const route = useRoute()
    const router = useRouter()
    const id = route.params.id
    const url = "/register/" + id
    console.log(route.params)

    const restaurants = restaurantData.restaurants.find(item => item.id == id) || {};

    const reserve = () => {
      router.push({
        path: url
      });
    };

    return {
      restaurants,
      reserve
    };
  }
});

</script>

<style scoped>

</style>
