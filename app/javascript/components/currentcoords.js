// const mapboxUrl = `https://api.mapbox.com/directions/v5/mapbox/driving/103.8404503,1.3022018;`
// const mapboxKey = `?access_token=${ENV['MAPBOX_API_KEY']}`
// const marinaCoords = '103.8693475,1.2933014;'

// const fetchCoords = () => {
//   navigator.geolocation.getCurrentPosition((data) => {
//     const longlat = `${data.coords.latitude},${data.coords.longitude};`
//     fetch(`${mapboxUrl}${longlat}/${marinaCoords}${mapboxKey}`)
//       .then(response => response.json())
//       .then((latLongData) => {
//         console.log(latLongData);
//       });
//   });
// }

function getGeoLocation() {
  navigator.geolocation.getCurrentPosition(setGeoCookie);
}

function setGeoCookie(position) {
  var cookie_val = position.coords.latitude + "|" + position.coords.longitude;
  document.cookie = "lat_lng=" + escape(cookie_val);
}

export { getGeoLocation, setGeoCookie };
