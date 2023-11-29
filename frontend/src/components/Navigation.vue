<template>
  <v-footer>
    <v-bottom-navigation grow>
      <v-btn value="favorites" @click="goHome">
        <v-icon>mdi-home</v-icon>

        <span>홈</span>
      </v-btn>
      <v-btn value="recent" @click="goSearch">
        <v-icon>mdi-magnify</v-icon>

        <span>검색</span>
      </v-btn>

      <v-btn value="nearby" @click="goMyInfo">
        <v-icon>mdi-face-man</v-icon>

        <span>내 정보</span>
      </v-btn>
    </v-bottom-navigation>
  </v-footer>
</template>

<script lang="ts" setup>
import {useRouter} from "vue-router";

const router = useRouter();
const goHome = () => router.push('home');
const goSearch = () => router.push('search');
const goMyInfo = () => router.push('mypage');
</script>
