import axios from 'axios';

const getAddress = (lat: Number, lng: Number) : Promise<GeocodeQueryResponse> => axios.get(`https://maps.googleapis.com/maps/api/geocode/json?latlng=${lat},${lng}&key=${process.env.GOOGLE_MAP_API_KEY}`)

interface GeocodeQueryResponse {
    plus_code: any,
    results: Array<GeocodeQueryResult>
}

interface GeocodeQueryResult {
    address_components: GeocodeAddress,
    formatted_address: string,
    place_id: string,
    types: Array<string>
}

interface GeocodeAddress {
    long_name: string,
    short_name: string,
    types: Array<string>
}

export default getAddress;