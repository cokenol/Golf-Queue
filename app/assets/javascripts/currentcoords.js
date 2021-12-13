
navigator.geolocation.getCurrentPosition(setGeoCookie);

navigator.permissions.query({ name: 'geolocation' }).then(function (result) {
  if (result.state === 'granted') {
    // debugger;
    console.log("connected");
    navigator.geolocation.getCurrentPosition(setGeoCookie);
    // showMap();
  } else if (result.state === 'prompt') {
    console.log("Not allowed");
    showButtonToEnableMap();
    navigator.geolocation.getCurrentPosition(setGeoCookie);
  }
});

function setGeoCookie(position) {
  var cookie_val = position.coords.latitude + "|" + position.coords.longitude;
  document.cookie = "lat_lng=" + escape(cookie_val);
  location.reload();

    // Don't do anything if the permission was denied.

}

//export { getGeoLocation, setGeoCookie };
