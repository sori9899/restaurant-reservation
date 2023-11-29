<template>
    <v-container>
        <v-card
        class="mx-auto mb-4"
        max-width="920"
        min-width="400"
        >
        <v-list>
            <v-list-item>
                <v-list-item-title class="list-title">
                    예약 목록
                </v-list-item-title>
            </v-list-item>

            <v-list-item-group v-if="reservations.length > 0">
            <!-- Loop through reservations and display each item -->
            <v-list-item v-for="(reservation, index) in reservations" :key="index" class="each-reserv">
                <!-- Display reservation information -->
                <div class="list-item mb-2 mt-2" >
                    <v-list-item-content>
                        <v-list-item-title>
                            {{ index + 1 }}. {{ reservation.restaurantName }}
                        </v-list-item-title>

                        <v-list-item-subtitle>
                            예약 날짜: {{ reservation.strdate }}
                        </v-list-item-subtitle>
                    </v-list-item-content>
                    
                    <!-- Delete button -->
                    <div class="list-item-action">
                        <v-list-item-action>
                            <v-btn @click="updateReservation(reservation.rid)" icon  variant="text" class="delete-bnt">
                                <v-icon color="black">mdi-pencil</v-icon>
                            </v-btn>
                        </v-list-item-action>

                        <v-list-item-action>
                            <v-btn @click="deleteReservation(index)" icon  variant="text" class="delete-bnt">
                                <v-icon color="black">mdi-delete</v-icon>
                            </v-btn>
                        </v-list-item-action>
                    </div>
                </div>
            </v-list-item>
            </v-list-item-group>

            <!-- Display message if no reservations -->
            <v-list-item v-else>
            <v-list-item-content>No reservations available.</v-list-item-content>
            </v-list-item>
        </v-list>
        </v-card>
    </v-container>
</template>

<script setup>
import regervationjson from '@/database/regervation.json';

</script>


<script>
export default{
    data: () => ({
        rjson : regervationjson,
        reservations: [],
    }),
    methods:{
        deleteReservation(index) {
            // 예약 삭제 로직을 구현
            this.reservations.splice(index, 1);
        },
        updateReservation(index){
            const url = "/update/" + index;
            this.$router.push({
                path: url
            })
        }
    },
    mounted(){
        const json = this.rjson.regervation;
        for(var i=0; i<json.length; i++){
            this.reservations.push(json[i])
        }
    }
}
</script>


<style scoped>

.list-item{
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    align-items: center;
    justify-content: space-between;
}

.each-reserv:hover{
    color: rgb(0, 0, 0);
    background-color: rgb(218, 218, 218);
}

.list-item-action{
    display: flex;
}

.list-title{
    font-size: 24px;
    font-weight: 800;
}

</style>