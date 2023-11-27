<template>
  <v-app>
    <search-toolbar />
    <slide-groups />
    <google-map />
    <navigation />
  </v-app>
</template>

<script lang="ts" setup>
import SearchToolbar from '@/components/SearchToolbar.vue';
import Navigation from '@/components/Navigation.vue';
import GoogleMap from '@/components/GoogleMap.vue';
import SlideGroups from '@/components/SlideGroups.vue';
</script>
