"use strict"

var HOSTNAME = "planyourpicnic.dja.id.au"

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
    url: 'http://'+HOSTNAME+'/data/bbq.kml?random=' + nonce,
    preserveViewport: true
  });
  layersVisible.BBQ = true;
  layers.BBQ.setMap(map);

  layers.tables = new google.maps.KmlLayer({
    url: 'http://'+HOSTNAME+'/data/furnitures_tables.kml?random=' + nonce,
    preserveViewport: true
  });
  layersVisible.tables = false;
  $('#tables').addClass('disabled');

  layers.toilets = new google.maps.KmlLayer({
    url: 'http://'+HOSTNAME+'/data/toilets.kml?random=' + nonce,
    preserveViewport: true
  });
  layersVisible.toilets = true;
  layers.toilets.setMap(map);

  layers.playgrounds = new google.maps.KmlLayer({
    url: 'http://'+HOSTNAME+'/data/playgrounds.kml?random=' + nonce,
    preserveViewport: true
  });
  layersVisible.playgrounds = true;
  layers.playgrounds.setMap(map);

}

google.maps.event.addDomListener(window, 'load', initialize);


$(document).on('ready', function() {

  // wire up some event handlers
  $("#BBQ").on('click', function() {
    toggleLayer('BBQ');
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
  $('#' + layer).toggleClass('disabled', !layersVisible[layer]);
}
