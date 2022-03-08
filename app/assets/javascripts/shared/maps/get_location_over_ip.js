// in html you need:
//         <a href="javascript:void(0)" id="js_find_my_location"> Fing my location </a> 
// form need some fields for example:
//        <%= f.hidden_field :longitude, class: "js_longitude" %>
//        <%= f.hidden_field :latitude, class: "js_latitude" %>


$("#js_find_my_location").click(function() {

  $.getJSON(`http://www.geoplugin.net/json.gp`).done(function(response) {
    var lat = response.geoplugin_latitude;
    var lon = response.geoplugin_longitude;
  
    var position = new OpenLayers.LonLat(lon, lat).transform(
      new OpenLayers.Projection("EPSG:4326"),
      new OpenLayers.Projection("EPSG:900913"),
    );

    var marker = new OpenLayers.Marker(position, globalIcon)
    globalMarkers.clearMarkers();
    globalMarkers.addMarker(marker);

    var fromP = new OpenLayers.Projection("EPSG:4326");   
    var toP   = new OpenLayers.Projection("EPSG:900913"); 

    oMap.setCenter(new OpenLayers.LonLat(lon, lat).transform(fromP, toP));

    // number field or hidden fields that have class=js_latitude or js_longitude
    $( ".js_latitude" ).val(lat);
    $( ".js_longitude" ).val(lon);
  });
});

