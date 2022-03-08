/*
LEAR MORE ON:
 maps and layers:
   https://wiki.openstreetmap.org/wiki/OpenLayers

 projections:
   http://openstreetmapdata.com/info/projections

 markers:
   http://dev.openlayers.org/docs/files/OpenLayers/Marker-js.html

 popups:
   http://dev.openlayers.org/docs/files/OpenLayers/Popup-js.html
   */
var oMap;
var attempt = 0;

const defaultOmActiveMarker = {
  icon: '../maps/omaps/img/active_pin.png',
  size: {w: 23, h: 23}
};
const defaultOmInactiveMarker = {
  icon: '../maps/omaps/img/inactive_pin.png',
  size: {w: 23, h: 23}
};

// user in edit.js.erb (contact info)
var globalMarkers; 

function initOmap(id) {
  oMap = new OpenLayers.Map(id);
  oMap.addLayer(new OpenLayers.Layer.OSM());
  oMap.zoomToMaxExtent();
};

function oMapRescue(props) {
  if (!props || Object.keys(props).length === 0) {
    console.log("add some props!");
    return true;
  } else {
    // if no oMap try to load it 10 times
    if (!oMap && attempt < 10) {
      attempt++;
      console.log("No map! Attempt no."+attempt+". Trying again!");
      setTimeout(function(){ oMapAdd(props) }, 1000);
      return true;
    } else if (!oMap && attempt >= 10) {
      console.log("Can't load maps!");
      return true;
    }
  }
  // everithing OK
  return false;
}

function oMapAdd(props) {
  // rescue
  if (oMapRescue(props)) { return null };

  // get props
  let pins = props.pins ? props.pins : []; 
  let center = props.center ? props.center : null;
  let fromProjection = props.projections && props.projections.from ? props.projections.from : "EPSG:4326"; // Transform from WGS 1984
  let toProjection = props.projections && props.projections.to ? props.projections.to : "EPSG:900913"; // to Spherical Mercator Projection

  //SET PROJECTIONS
  var fromP = new OpenLayers.Projection(fromProjection);   
  var toP   = new OpenLayers.Projection(toProjection); 

  //SET POSITION AND ZOOM
  if (center) {
    if (center.latitude && center.longitude) {
      let zoom = center.zoom || oMap.getZoom(); // take current zoom if none
      oMap.setCenter(
        new OpenLayers.LonLat(center.longitude, center.latitude)
        .transform(fromP, toP), zoom);
    } else {
      console.log("Need latitude and longitude to set center! For example {latitude: 45.562566, longitude: 18.669857, zoom: 10 }");
    }
  }

  // add pins to map
  var markers = new OpenLayers.Layer.Markers( "Markers" );
  for(var i=0; i < pins.length; i++) {
    let lon = pins[i].longitude;
    let lat = pins[i].latitude;
    let iconImg = (pins[i].marker && pins[i].marker.icon) ? pins[i].marker.icon : defaultOmInactiveMarker.icon;
    let iconW = (pins[i].marker && pins[i].marker.size && pins[i].marker.size.w) ? pins[i].marker.size.w : defaultOmInactiveMarker.size.w;
    let iconH = (pins[i].marker && pins[i].marker.size && pins[i].marker.size.h) ? pins[i].marker.size.h : defaultOmInactiveMarker.size.h;
    let infoWindow = pins[i].infoWindow ? pins[i].infoWindow : false;
    let callback = pins[i].callback ? pins[i].callback : false;

    if (lon && lat) {
      // size of the icon
      var size = new OpenLayers.Size(iconW, iconH);
      // position of the icon on the position
      var offset = new OpenLayers.Pixel(-(size.w/2), -size.h);
      var icon = new OpenLayers.Icon(iconImg, size, offset);

      var position = new OpenLayers.LonLat(lon, lat).transform(fromP, toP);
      var marker = new OpenLayers.Marker(position, icon)

      // will open info popup on click
      if (infoWindow) { marker.events.register( 'click', markers, 
        function() {
          clickMarker(position, infoWindow)
        } 
      )};

      // will run some external function. That function MUST be loaded before the map
      if (callback) { marker.events.register( 'click', markers, callback) };

      markers.addMarker(marker);
    } else {
      console.log("Markers need latitude and longitude. For example {latitude: 45.563635, longitude: 18.662450 } ")  
    }
  }

  globalMarkers = markers;
  oMap.addLayer(markers);

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

    // close all open
    if (closeOpenPopups.toLowerCase() == "yes" || closeOpenPopups.toLowerCase() == "y") {
      for(var p=0; p<popups.length; p++) {
        popups[p].destroy()
        popups.splice(p, 1);
      }
    }

    if (elements && elements.length > 0) {
      // if infowindow has some custom position independent of the markers position
      if (longitude && latitude) { infoWindowPosition = new OpenLayers.LonLat(longitude, latitude) }

      // add more elements <h1> Title </h1> <p> ...
      for (var i=0; i<elements.length; i++) {container += elements[i] }

      // Make a popup
      popup = new OpenLayers.Popup(id,
        position,
        new OpenLayers.Size(w,h),
        container,
        true);

      popups.push(popup); // so it can be closed when some other is open
      oMap.addPopup(popup);
    }
  }
};

function runOnclick(modulId) {
  oMap.events.register("click", oMap, function(e) {
    var position = oMap.getLonLatFromPixel(e.xy);
    position.transform(new OpenLayers.Projection("EPSG:900913"), new OpenLayers.Projection("EPSG:4326"));

    // update input fields
    $(`#${modulId}_longitude`).val(position.lon.toFixed(6))
    $(`#${modulId}_latitude`).val(position.lat.toFixed(6))

    // add pin to map
    var globalIcon = new OpenLayers.Icon(
      defaultOmInactiveMarker.icon, 
      defaultOmActiveMarker.size, 
      new OpenLayers.Pixel(-(defaultOmActiveMarker.size.w/2), - defaultOmActiveMarker.size.h)
    );
    let lon = position.lon;
    let lat = position.lat;
    var position = new OpenLayers.LonLat(lon, lat).transform(
      new OpenLayers.Projection("EPSG:4326"),
      new OpenLayers.Projection("EPSG:900913"),
    );

    var marker = new OpenLayers.Marker(position, globalIcon)
    globalMarkers.clearMarkers();
    globalMarkers.addMarker(marker);
  }); 
}
