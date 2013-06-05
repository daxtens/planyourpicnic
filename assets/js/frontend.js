"use strict"

var HOSTNAME = "planyourpicnic.dja.id.au"

var layers = {};
var layersVisible = {};
var map;

var position;

function initialize() {
  var nonce = Math.random();

  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(updatePosition, positionError);
  } else {
    position = new google.maps.LatLng(-35.27603,149.13435);
  }
  
  if (!position) position = new google.maps.LatLng(-35.27603,149.13435);
  
  console.log(position);
  
  var mapOptions = {
    zoom: 14,
    center: position,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }

  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

  layers.BBQ = new google.maps.KmlLayer({
    url: 'http://'+HOSTNAME+'/data/bbq.kml?random=' + nonce,
    preserveViewport: true
  });
  
  layers.tables = new google.maps.KmlLayer({
    url: 'http://'+HOSTNAME+'/data/furnitures_tables.kml?random=' + nonce,
    preserveViewport: true
  });
  
  layers.toilets = new google.maps.KmlLayer({
    url: 'http://'+HOSTNAME+'/data/toilets.kml?random=' + nonce,
    preserveViewport: true
  });
  
  layers.playgrounds = new google.maps.KmlLayer({
    url: 'http://'+HOSTNAME+'/data/playgrounds.kml?random=' + nonce,
    preserveViewport: true
  });
  
  layers.targets = new google.maps.KmlLayer({
    url: 'http://'+HOSTNAME+'/dynamicmap.kml/1/1/1/0?random=' + nonce,
    preserveViewport: true
  });
  
  // Ensure targets loads after other layers. We don't wait for tables since it doesn't load by default
  var listener1 = google.maps.event.addListener(layers.BBQ, 'metadata_changed', function() {
    google.maps.event.clearListeners(layers.BBQ, 'metadata_changed');
    var listener2 = google.maps.event.addListener(layers.toilets, 'metadata_changed', function() {
      google.maps.event.clearListeners(layers.tables, 'metadata_changed');
      var listener3 = google.maps.event.addListener(layers.playgrounds, 'metadata_changed', function() {
        google.maps.event.clearListeners(layers.playgrounds, 'metadata_changed');
        layers.targets.setMap(map);
      });
    });
  });
  layersVisible.BBQ = true;
  layers.BBQ.setMap(map);
  layersVisible.tables = false;
  $('#tables').addClass('disabled');
  layersVisible.toilets = true;
  layers.toilets.setMap(map);
  layersVisible.playgrounds = true;
  layers.playgrounds.setMap(map);
    
  google.maps.event.addListener(layers.BBQ, 'click', getSidebar);
  google.maps.event.addListener(layers.tables, 'click', getSidebar);
  google.maps.event.addListener(layers.toilets, 'click', getSidebar);
  google.maps.event.addListener(layers.playgrounds, 'click', getSidebar);
  google.maps.event.addListener(layers.targets, 'click', getSidebarDestination);

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


function getSidebar(kmlEvent) {
    var title = kmlEvent.featureData.name;
    var firstHyphen = title.indexOf('-');
    var secondHyphen = title.indexOf('-', firstHyphen + 1);
    var suburb = title.substr(firstHyphen + 1, secondHyphen - firstHyphen - 1 );
    
    $.ajax({url: 'http://' + HOSTNAME + '/sidebar/' + suburb, 
           success: function(data) {
            $('#sidebar').html(data);
        }
    });
    return false;
}

function getSidebarDestination(kmlEvent) {
    var suburb;
    var title = kmlEvent.featureData.name;
    var firstParens = title.indexOf('(');
    if (firstParens != -1) {
        suburb = title.substr(firstParens + 1, title.length - firstParens - 2);
    } else {
        suburb = title;
    }
    $.ajax({url: 'http://' + HOSTNAME + '/sidebar/' + suburb, 
           success: function(data) {
            $('#sidebar').html(data);
        }
    });
    return false;
}

function updatePosition(position) {
    position = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
    map.panTo(position);
}

function positionError(error) {
    position = new google.maps.LatLng(-35.27603,149.13435);
    map.panTo(position);
}