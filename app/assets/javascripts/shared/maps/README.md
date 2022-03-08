# All Maps
All Maps contains OpenLayers and Gogole Maps libraries and everything you need 
to apply them in everyday projects.

## OpenLayers - OpenStreetMap 
[OpenLayers](https://wiki.openstreetmap.org/wiki/OpenLayers) is an open-source 
implementation of a "Slippy Map" interface. It is completely free and should be 
preferred in Bamboolab projects.

### Installation
1. Copy & paste the omaps/ folder somewhere where it can be easily accessed. Look at [rails asset organization](https://guides.rubyonrails.org/asset_pipeline.html#asset-organization)

2. **Include** the library in app/assets/javascripts/application.js
```
//= require omaps/OpenLayers
//= require omaps/initOmap
```

or if you paste the library to public/ folder you could add it to application.html.erb (or to a html page that will show the map). Read first the **[rails asset pipeline](https://guides.rubyonrails.org/asset_pipeline.html)**
```
<html>
  <head>
    <title>Maps</title>
    <!-- Include map lib -->
    <script src="https://www.project-name.eu/omaps/OpenLayers.js"></script>

      <!-- Include map inits and configs -->
      <script src="https://www.project-name.eu/omaps/initOmap.js"></script>
```
If you are adding Google Maps include like this: 
```
<html>
  <head>
    <title>Maps</title>
    <!-- Include map libs -->
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAFNtxECx2G3n4fn5UTUaXYm6Tl3lVYoRw&callback=initGmap"></script>

    <!-- Include map inits and configs -->
    <script src="./gmaps/initGmap.js"></script>
```

3. **Create** a container div on a html page that will show the map.

```
    <h1>OpenStreetMap</h1>
    <div id="js_osm" style="height:250px" > </div>

```

4. **Initialize** the map after the DOM has been loaded:
```
<script>
  var pins = [{latitude: 45.562566, longitude: 18.669857} ];

  // Init maps
  initOmap("js_osm"); //js_osm is id of the container div
  // Google maps is init by the callback in <head>
  
  // Add positions (try 10 times)
  oMapAdd({pins: pins }); // all props optional
  // or
  gMapAdd({pins: pins }); // all props optional

  // if map is clickable add event (only for Open Street map - TODO add for google map)
  runOnclick("contact_info")
</script>
```

### Methods and properties
**initOmap(id)** is called on the html that will display the map. Id is the id of the container div that has been loaded in the DOM. Call on this function is inevitable. 

**oMapAdd(props)** is called after initOmap. It will add pins to the map and it will try it for 10 times. After each unsuccessful attemptd it will wait 1 second. Props is an object {} with keys: 
1. *pins* - is an array of objects which represent markers on the map. Each element of the pin array has keys:
   - latitude (required integer) - geographic coordinate like: 45.562566,
   - longitude (required integer) - geographic coordinate like: 18.676751,
   - marker (optional object) - determine the appearance and behavior of marker, it has keys: 
     * icon (optional string) - path to image that will be the marker,
     * size (optional object) - size of the pin: {w: 30, h: 30},
     * callback (optional function) - run a script after click on the marker
   - infoWindow (optiona object) - determine the appearance of a popup that will appear after the marker was clicked, it has keys:
     * id (optional string) - should be uniq
     * elements (optiona array) - elements of the array are strings formated like html tags - an element could be a [rails partial](https://guides.rubyonrails.org/layouts_and_rendering.html#using-partials)
     * longitude (optional integer) - geographic coordinate of the window
     * latitude (optional integer) - geographic coordinate of the window
     * w  (optional integer) - width of the window - default is 200px
     * h  (optional integer) - height of the window - default is 200px
     * closeOpenPopups (optional string) - default is "yes" but if set to anythig else click on this won't close the previous clicked window

2. *center* - is an object that determine the center and zoom of the map. It has keys:
   - latitude (required integer) - geographic coordinate like: 45.562566,
   - longitude (required integer) - geographic coordinate like: 18.676751,
   - zoom (optional integer) - zoom map to some value
  
3. *projection* - is an optiona object {from: "EPSG:4326", to: "EPSG:900913" } - only for OpenLayers

### Example:
Download the whole repository. Open and double click lounch_maps.html. It will show a map with 3 markers in Osijek. One Is a custom icon and click on it will run a alert message. Click on one marker will open info window with the message: Hello.
![preview image](https://gitlab.com/bamboolab/all_maps/raw/6481c6e4c8236e6e572c54333220661faed14853/preview.png)

### Useful links:
 ***maps and layers:*** https://wiki.openstreetmap.org/wiki/OpenLayers

 ***projections:*** http://openstreetmapdata.com/info/projections

 ***markers:*** http://dev.openlayers.org/docs/files/OpenLayers/Marker-js.html

 ***popups:*** http://dev.openlayers.org/docs/files/OpenLayers/Popup-js.html




