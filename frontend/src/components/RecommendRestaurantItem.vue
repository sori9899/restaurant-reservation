<template>
  <v-card
      class="mx-auto"
      max-width="1000"
  >
    <v-img
        :src="$props.image"
        height="100px"
        cover
    ></v-img>
    <v-card-title>{{ $props.title }}</v-card-title>
    <v-card-subtitle>{{ $props.subTitle }}</v-card-subtitle>
  </v-card>
</template>

<script lang="ts" setup>
defineProps<{
  image: string,
  title: string,
  subTitle: string
}>();
</script>
