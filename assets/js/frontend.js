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
  
  
  google.maps.event.addListener(layers.BBQ, 'click', function(kmlEvent) {
      var title = kmlEvent.featureData.name;
      var firstHyphen = title.indexOf('-');
      var secondHyphen = title.indexOf('-', firstHyphen + 1);
      var suburb = title.substr(firstHyphen, secondHyphen - firstHyphen);
      alert(suburb);
      //getSidebar(marker.getTitle());
  });
  

  layers.targets = new google.maps.KmlLayer({
    url: 'http://'+HOSTNAME+'/dynamicmap.kml/1/1/1/0?random=' + nonce,
    preserveViewport: true
  });
  layers.targets.setMap(map);

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

  layers.targets.setMap(null);
  layers.targets = new google.maps.KmlLayer({
    url: 'http://'+HOSTNAME+'/dynamicmap.kml/'+
        (layersVisible['BBQ'] ? 1 : 0) + '/' +
        (layersVisible['playgrounds'] ? 1 : 0) + '/' +
        (layersVisible['toilets'] ? 1 : 0) + '/' +
        (layersVisible['tables'] ? 1 : 0) + '?random=' + Math.random(),
    preserveViewport: true
  });
  layers.targets.setMap(map);

}
