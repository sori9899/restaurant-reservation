<template>
    <v-sheet class="mx-auto" elevation="8" max-width="100%">
        <v-slide-group v-model="model" class="pa-4" selected-class="bg-success" show-arrows>
            <v-slide-group-item v-for="n in 15" :key="n" v-slot="{ isSelected, toggle, selectedClass }">
                <SlideItem/>
                <!-- <v-card color="grey-lighten-1" :class="['ma-4', selectedClass]" height="200" width="100" @click="toggle">
                    <div class="d-flex fill-height align-center justify-center">
                        <v-scale-transition>
                            <v-icon v-if="isSelected" color="white" size="48" icon="mdi-close-circle-outline"></v-icon>
                        </v-scale-transition>
                    </div>
                </v-card> -->
            </v-slide-group-item>
        </v-slide-group>
    </v-sheet>
</template>

<script lang="ts" setup>
import { ref } from 'vue'
import SlideItem from '@/components/MockSlideItem.vue';

const model = ref(null)
</script>

<script lang="ts">
export default {
    data: () => ({
        model: null,
    }),
}
</script>