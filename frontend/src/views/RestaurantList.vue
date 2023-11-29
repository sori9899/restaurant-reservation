<template>
  <v-card
    class="mx-auto"
    max-width="100%"
  >
    <SearchToolbar></SearchToolbar>

    <v-list>
      <v-list-item
        v-for="(item, index) in items"
        :key="index"
        width="100%"
      >
        <v-list-item-content class="d-flex ma-3">
          <v-list-item-avatar>
            <a href="./restaurants/1"><img :src="item.prependAvatar" alt="avatar"></a>
          </v-list-item-avatar>

          <div class="ml-5">
            <v-list-item-title class="mb-5 mt-6" v-html="item.title"></v-list-item-title>
            <v-list-item-subtitle class="overflow-visible" v-html="item.subtitle"></v-list-item-subtitle>
          </div>
        </v-list-item-content>
      </v-list-item>
    </v-list>
  </v-card>
</template>

<script>
import SearchToolbar from "@/components/SearchToolbar.vue";
import {useRouter} from "vue-router";
useRouter()

export default {

  components: {SearchToolbar},
  data: () => ({
    items: [
      {
        prependAvatar: 'https://cdn.vuetifyjs.com/images/lists/1.jpg',
        title: '오마카세어진',
        subtitle: `다양한 안주와 스시를 즐길 수 있는 술이 맛있는 공간`,
      },
      {
        prependAvatar: 'https://cdn.vuetifyjs.com/images/lists/2.jpg',
        title: 'Summer BBQ',
        subtitle: `Wish I could come, but I'm out of town this weekend.`,
      },
      {
        prependAvatar: 'https://cdn.vuetifyjs.com/images/lists/3.jpg',
        title: 'Oui oui',
        subtitle: 'Do you have Paris recommendations? Have you ever been?',
      },
      {
        prependAvatar: 'https://cdn.vuetifyjs.com/images/lists/4.jpg',
        title: 'Birthday gift',
        subtitle: 'Have any ideas about what we should get Heidi for her birthday?',
      },
      {
        prependAvatar: 'https://cdn.vuetifyjs.com/images/lists/5.jpg',
        title: 'Recipe to try',
        subtitle: 'We should eat this: Grate, Squash, Corn, and tomatillo Tacos.',
      },
      {
        prependAvatar: 'https://cdn.vuetifyjs.com/images/lists/5.jpg',
        title: 'Recipe to try',
        subtitle: 'We should eat this: Grate, Squash, Corn, and tomatillo Tacos.',
      },
      {
        prependAvatar: 'https://cdn.vuetifyjs.com/images/lists/5.jpg',
        title: 'Recipe to try',
        subtitle: 'We should eat this: Grate, Squash, Corn, and tomatillo Tacos.',
      },
      {
        prependAvatar: 'https://cdn.vuetifyjs.com/images/lists/5.jpg',
        title: 'Recipe to try',
        subtitle: 'We should eat this: Grate, Squash, Corn, and tomatillo Tacos.',
      },
      {
        prependAvatar: 'https://cdn.vuetifyjs.com/images/lists/5.jpg',
        title: 'Recipe to try',
        subtitle: 'We should eat this: Grate, Squash, Corn, and tomatillo Tacos.',
      },
    ],
  }),
}
</script>

<style>
</style>
