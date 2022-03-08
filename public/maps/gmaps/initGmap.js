var gMap;
var attempt = 0;
const defaultGmActiveMarker = {
  icon: './gmaps/img/active_pin.png',
  size: {w: 23, h: 23}
};
const defaultGmInactiveMarker = {
  icon: './gmaps/img/inactive_pin.png',
  size: {w: 23, h: 23}
};

function initGmap(id) {
  var location = {lat: 45.556305, lng: 18.689596};
  var mapDiv = document.getElementById("js_gm");

  gMap = new google.maps.Map(mapDiv, {
    zoom: 10,
    center: location,
    icon: {
      size: new google.maps.Size(24, 24),
      scaledSize: new google.maps.Size(128, 64)
    },
  });
};

function gMapRescue(props) {
  if (!props || Object.keys(props).length === 0) {
    console.log("add some props!");
    return true;
  } else {
    // if no oMap try to load it 10 times
    if (!gMap && attempt < 10) {
      attempt++;
      console.log("No map! Attempt no."+attempt+". Trying again!");
      setTimeout(function(){ gMapAdd(props) }, 1000);
      return true;
    } else if (!gMap && attempt >= 10) {
      console.log("Can't load maps!");
      return true;
    }
  }
  // everithing OK
  return false;
}

function gMapAdd(props) {
  // rescue
  if (gMapRescue(props)) { return null };

  // get props
  let pins = props.pins ? props.pins : []; 
  let center = props.center ? props.center : null;

  var infoWindowList = []; // to close all the infoW before open a new one
  var markers = []; // to change all markers

  //SET POSITION AND ZOOM
  if (center) {
    if (center.latitude && center.longitude) {
      let zoom = center.zoom || gMap.getZoom(); // take current zoom if none
      gMap.setZoom(zoom);
      gMap.setCenter({lat: center.latitude, lng: center.longitude});
    } else {
      console.log("Need latitude and longitude to set center! For example {latitude: 45.562566, longitude: 18.669857, zoom: 10 }");
    }
  }


  for(var i=0; i < pins.length; i++) {
    let lon = pins[i].longitude;
    let lat = pins[i].latitude;
    let iconImg = (pins[i].marker && pins[i].marker.icon) ? pins[i].marker.icon : defaultGmInactiveMarker.icon;
    let iconW = (pins[i].marker && pins[i].marker.size && pins[i].marker.size.w) ? pins[i].marker.size.w : defaultGmInactiveMarker.size.w;
    let iconH = (pins[i].marker && pins[i].marker.size && pins[i].marker.size.h) ? pins[i].marker.size.h : defaultGmInactiveMarker.size.h;
    let infoWindow = pins[i].infoWindow ? pins[i].infoWindow : false;
    let callback = pins[i].callback ? pins[i].callback : false;

    if (lon && lat) {
      var pinIcon = new google.maps.MarkerImage(
        iconImg,
        null, /* size is determined at runtime */
        null, /* origin is 0,0 */
        null, /* anchor is bottom center of the scaled image */
        new google.maps.Size(iconW, iconH)
      );
     
      var position = new google.maps.LatLng(lat, lon);
      var marker = new google.maps.Marker({
        position: position,
        map: gMap,
        icon: pinIcon,
      });

      // will open info popup on click
      if (infoWindow) {
        google.maps.event.addListener(marker,'click', function() {
          clickMarker(position, infoWindow).open(gMap, this);
        })
      }

      // will run some external function. That function MUST be loaded before the map
      if (callback) { google.maps.event.addListener(marker, 'click', callback) };

      markers.push(marker);

      var popups = [];
      function clickMarker(position, infoWindow) {
        var container = "";

        var elements = infoWindow.elements ? infoWindow.elements : false;
        var infoWindowPosition = position;
        let id = infoWindow.id ? infoWindow.id : Date.now();
        let longitude = infoWindow.longitude ? infoWindow.longitude : false;
        let latitude = infoWindow.latitude ? infoWindow.latitude : false;
        let w = infoWindow.w ? infoWindow.w : "200";
        let h = infoWindow.h ? infoWindow.h : "200";
        let closeOpenPopups = infoWindow.closeOpenPopups ? infoWindow.closeOpenPopups : "yes";

        // close all popups
        if (closeOpenPopups.toLowerCase() == "yes" || closeOpenPopups.toLowerCase() == "y") {
          for (var p=0; p<popups.length; p++) {
            popups[p].close()
            popups.splice(p, 1);
          };
        }

        if (elements && elements.length > 0) {
          // if infowindow has some custom position independent of the markers position
          if (longitude && latitude) {  position = new google.maps.LatLng(latitude, longitude) }

          // add more elements <h1> Title </h1> <p> ...
          for (var i=0; i<elements.length; i++) {container += elements[i] }

          var popup = new google.maps.InfoWindow({
            content: container,
            position: position,
          });

          popups.push(popup); // so it can be closed when some other is open
          return popup;
        }
      }
    } else {
      console.log("Markers need latitude and longitude. For example {latitude: 45.563635, longitude: 18.662450 } ")  
    }
  }
};
