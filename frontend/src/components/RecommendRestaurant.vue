<template>
  <v-sheet class="mx-auto" elevation="5" max-width="100%">
    <v-card-title class="text-h4">🍱<strong>주변 식당 추천🍱</strong></v-card-title>
    <v-divider/>
    <v-slide-group class="pa-4" selected-class="bg-success" show-arrows>
      <v-slide-group-item v-for="restaurant in restaurants" v-slot="{ isSelected, toggle, selectedClass }">
        <RecommendRestaurantItem
          :image="restaurant.image"
          :title="restaurant.title"
          :sub-title="restaurant.subTitle"
        />
      </v-slide-group-item>
    </v-slide-group>
  </v-sheet>
</template>

<script lang="ts">
import {restaurants} from '@/database/RecommendResturant.json';
import {defineComponent} from "vue";
import RecommendRestaurantItem from "@/components/RecommendRestaurantItem.vue";

export default defineComponent({
  components: {RecommendRestaurantItem},
  setup(){
    return { restaurants }
  }
});
</script>
