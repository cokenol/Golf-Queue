const fetchCoords = () => {
  navigator.geolocation.getCurrentPosition((data) => {
    const lat = data.coords.latitude;
    const long = data.coords.longitude;
    console.log(`lat: ${lat} long: ${long}`);
  });
}

export { fetchCoords };
