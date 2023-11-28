<template>
    <v-card-text>
        I'm a thing. But, like most politicians, he promised more than he could deliver. You won't have time for
        sleeping, soldier, not with all the bed making you'll be doing. Then we'll go with that data file! Hey, you
        add a one and two zeros to that or we walk! You're going to do his laundry? I've got to find a way to escape.
    </v-card-text>

    <v-btn
        variant="text"
        @click="Register"   
      >
        예약하기
      </v-btn>

</template>

<script setup>
import {ref} from 'vue'

const show = ref(false)
</script>


<script>
export default {
    data: () => ({
        show: false,
    }),
    methods:{
        Register : function(){
            this.$router.push({path:'/register'})
        }
    }
}
</script>

<style scoped>

.v-btn{
    color: blue;
    font-style: italic;
}

.v-btn:hover{
    color: rgb(219, 18, 18);
}

</style>