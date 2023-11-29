<template>
  <v-card
    class="mx-auto"
    max-width="100%"
  >
    <SearchToolbar></SearchToolbar>

    <v-list>
      <v-list-item
        v-for="(item, index) in restaurants"
        :key="index"
        width="100%"
        @click="goToReservation(item.id)"
      >
        <v-list-item-content class="d-flex ma-3">
            <v-list-item-avatar>
                <img :src="item.photo" alt="avatar" style="width: 120px; height: 140px;">
            </v-list-item-avatar>
          <div class="ml-5">
            <v-list-item-title class="mb-5 mt-8" v-html="item.name"></v-list-item-title>
            <v-list-item-subtitle class="overflow-visible" v-html="item.description"></v-list-item-subtitle>
          </div>
        </v-list-item-content>
      </v-list-item>
    </v-list>
  </v-card>
</template>

<script>
import SearchToolbar from "@/components/SearchToolbar.vue";
import restaurantData from "@/database/Restaurant.json";

export default {
  components: { SearchToolbar },
  data() {
    return {
      restaurants: restaurantData.restaurants,
    };
  },
  methods: {
    goToReservation(id) {
      const url = '/restaurants/' + id;

      this.$router.push({
        path: url,
      });
    },
  },
};
</script>

<style>
</style>
