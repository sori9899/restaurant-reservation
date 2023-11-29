<template>
    <v-container>
        <RergervationVue v-bind:Cvalue="update"></RergervationVue>
    </v-container>
</template>


<script setup>
import RergervationVue from "@/components/Rergervation.vue";

</script>

<script>
export default{
    data: () => ({
        update:"update"
    }),
}
</script>



