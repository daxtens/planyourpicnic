"use strict"

var layers = {};
var layersVisible = {};
var map;

function initialize() {
  var nonce = Math.random();

  var canberra = new google.maps.LatLng(-35.27603,149.13435);
  var mapOptions = {
    zoom: 14,
    center: canberra,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }

  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

  layers.BBQ = new google.maps.KmlLayer({
    url: 'http://dja.dja.id.au/data/bbq.kml?random=' + nonce,
    preserveViewport: true
  });
  layersVisible.BBQ = true;
  layers.BBQ.setMap(map);

  layers.seats = new google.maps.KmlLayer({
    url: 'http://dja.dja.id.au/data/publicfurniture.kml?random=' + nonce,
    preserveViewport: true
  });
  layersVisible.seats = true;
  layers.seats.setMap(map);

  layers.tables = new google.maps.KmlLayer({
    url: 'http://dja.dja.id.au/data/tables.kml?random=' + nonce,
    preserveViewport: true
  });
  layersVisible.tables = false;

  layers.toilets = new google.maps.KmlLayer({
    url: 'http://planyourpicnic.dja.id.au/data/toilets.kml?random=' + nonce,
    preserveViewport: true
  });
  layersVisible.toilets = false;

  layers.playgrounds = new google.maps.KmlLayer({
    url: 'http://dja.dja.id.au/data/playgrounds.kml?random=' + nonce,
    preserveViewport: true
  });
  layersVisible.playgrounds = false;

}

google.maps.event.addDomListener(window, 'load', initialize);


$(document).on('ready', function() {

  // wire up some event handlers
  $("#BBQ").on('click', function() {
    toggleLayer('BBQ');
  });

  $("#seats").on('click', function() {
    toggleLayer('seats');
  });

  $("#tables").on('click', function() {
    toggleLayer('tables');
  });

  $("#toilets").on('click',function() {
    toggleLayer('toilets');
  });

  $("#playgrounds").on('click', function() {
    toggleLayer('playgrounds');
  });
});


function toggleLayer(layer) {
  if (layersVisible[layer]) {
    layers[layer].setMap(null);
    layersVisible[layer] = false;
  } else {
    layers[layer].setMap(map);
    layersVisible[layer] = true;
  }
}