<template>
  <v-bottom-navigation grow>
    <v-btn 
    value="favorites"
    @click="ToHome()"
    >
      <v-icon>mdi-home</v-icon>

      <span>홈</span>
    </v-btn>
    <v-btn value="recent">
      <v-icon>mdi-magnify</v-icon>

      <span>검색</span>
    </v-btn>

    <v-btn 
    value="nearby"
    @click="ToMyPage()"
    >
      <v-icon>mdi-face-man</v-icon>

      <span>내 정보</span>
    </v-btn>
  </v-bottom-navigation>
</template>

<script>
export default {
  data(){
    return{

    }
  },
  methods:{
    ToMyPage(){
      this.$router.push({
        path:"/mypage"
      })
    },
    ToHome(){
      this.$router.push({
        path:"/"
      })
    }
  }
}
</script>

<style scoped>

</style>
