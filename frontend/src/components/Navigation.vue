<template>
  <v-bottom-navigation grow>
    <v-btn value="favorites">
      <v-icon>mdi-home</v-icon>

      <span>홈</span>
    </v-btn>
    <v-btn value="recent">
      <v-icon>mdi-magnify</v-icon>

      <span>검색</span>
    </v-btn>

    <v-btn value="nearby">
      <v-icon>mdi-face-man</v-icon>

      <span>내 정보</span>
    </v-btn>
  </v-bottom-navigation>
</template>