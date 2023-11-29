<template>
    <v-container>
        <v-card
        class="mx-auto mb-4"
        max-width="920"
        min-width="400"
        >
            <div class="uinfo-title">
                <v-card-item>
                <div class="ma-4">
                <v-img
                class="bg-white round"
                width="150"
                :aspect-ratio="1"
                src="src/img/user.png"
                cover
                ></v-img>
            </div>
            </v-card-item>

            <div>
                <v-card-title>
                    Username
                </v-card-title>
                <v-card-title>
                    가입시기 : 23.10.12
                </v-card-title>
                <v-card-title>
                    Tel. 010.8883.2384
                </v-card-title>
            </div>
            </div>
        </v-card>
    </v-container>
</template>




<style scoped>
.uinfo-title{
    display: flex;
    align-items: center;
    flex-wrap: wrap;
}
</style>