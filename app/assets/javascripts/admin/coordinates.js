var coordinatesRunning=false;
var mapUpdated = true;
function coordinateSetOnMap(target, action) {
  coordinatesRunning = {
    target: target,
    action: action
  };
  mapUpdated=false;
};
function stopCoordinates() {
  coordinatesRunning = false;
}

setInterval(function(){ 
  if (coordinatesRunning) {
    var action = coordinatesRunning.action;
    var target = coordinatesRunning.target;
    var newVal = $(`#${target}`).val();
    if (action == "+") {
      newVal = (parseFloat(newVal) + 0.005).toFixed(6)
    } else {
      newVal = (parseFloat(newVal) - 0.005).toFixed(6)
    }

    $(`#${target}`).val(newVal);
  } else {
    if (!mapUpdated) {
      var l = {
        latitude: $(".js_latitude").val(),
        longitude: $(".js_longitude").val()
      };

      var globalIcon = new OpenLayers.Icon(
        defaultOmInactiveMarker.icon, 
        defaultOmActiveMarker.size, 
        new OpenLayers.Pixel(-(defaultOmActiveMarker.size.w/2), - defaultOmActiveMarker.size.h)
      );

      let lon = l.longitude;
      let lat = l.latitude;

      var position = new OpenLayers.LonLat(lon, lat).transform(
        new OpenLayers.Projection("EPSG:4326"),
        new OpenLayers.Projection("EPSG:900913"),
      );

      var marker = new OpenLayers.Marker(position, globalIcon)
      globalMarkers.clearMarkers();
      globalMarkers.addMarker(marker);

      mapUpdated=true;
    } 
  }
}, 100);
