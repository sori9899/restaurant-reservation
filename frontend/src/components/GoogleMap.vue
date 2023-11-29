<template>
  <GoogleMap :api-key="googleMapApiKey" style="width: 100%; height: 80%" :center="center" :zoom="15">
    <Marker :options="{ position: center }" />
  </GoogleMap>
</template>

<script lang="ts">
import { ref } from "vue";
import { Ref } from "vue";
import { defineComponent } from "vue";
import { GoogleMap, Marker } from "vue3-google-map";

const googleMapApiKey: Ref<string | undefined> = ref(process.env.GOOGLE_MAP_API_KEY);

export default defineComponent({
  components: { GoogleMap, Marker },
  setup() {
    const center = ref({ lat: 37.550406, lng: 127.014634 });
    const address = ref("");

    const getUserLocation = () => {
      const isSupported = 'navigator' in window && 'geolocation' in navigator
      if (isSupported) {
        navigator.geolocation.getCurrentPosition((position) => {
          center.value.lat = position.coords.latitude
          center.value.lng = position.coords.longitude
        })
      }
    }

    getUserLocation();

    return { center, googleMapApiKey };
  },
});
</script>
