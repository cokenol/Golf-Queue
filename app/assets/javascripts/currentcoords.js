
navigator.geolocation.getCurrentPosition(setGeoCookie);


function setGeoCookie(position) {
  var cookie_val = position.coords.latitude + "|" + position.coords.longitude;
  document.cookie = "lat_lng=" + escape(cookie_val);
  location.reload();
}

//export { getGeoLocation, setGeoCookie };