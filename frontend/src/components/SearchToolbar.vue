<template>
  <v-card class="pa-3" flat>
    <v-toolbar dense floaing class="rounded-pill">
      <v-toolbar-title>지역, 음식, 매장명 검색</v-toolbar-title>
      <v-spacer/>
      <v-btn icon @click="onClickMagnify">
        <v-icon>mdi-magnify</v-icon>
      </v-btn>
    </v-toolbar>
  </v-card>
</template>

<script lang="ts">
import {defineComponent} from "vue";
import {useRouter} from "vue-router";


export default defineComponent({
  props: {
    mode: String
  },
  emits: ['submit'],
  setup(props, {emit}) {
    const router = useRouter();
    const mode = props.mode;
    const goSearch = () => router.push('search');
    const emitSubmit = () => emit('submit');

    return {mode, onClickMagnify: mode == 'submit' ? emitSubmit : goSearch}
  }
})
</script>
