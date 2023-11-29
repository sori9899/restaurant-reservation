
<template>
  <v-container>
    <RergervationVue v-bind:Cvalue="write"></RergervationVue>
  </v-container>
</template>

<script setup>
import RergervationVue from '@/components/Rergervation.vue'
</script>

<script>

export default {
    data: () => ({
        write:"write"
    }),
}

</script>