<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Plan Your Picnic!</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Plan your picnic around Canberra - find BBQs, playgrounds and public toilets.">
    <meta name="author" content="Hungry Hungry Hackers, GovHack 2013">
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/css/bootstrap-responsive.css" rel="stylesheet">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="assets/js/html5shiv.js"></script>
    <![endif]-->

    <!-- Fav and touch icons - TODO FIXME
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">
    <link rel="shortcut icon" href="assets/ico/favicon.png">-->

    <link href="assets/css/footer.css" rel="stylesheet">
    <link href="assets/css/gmaps.css" rel="stylesheet">

    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
  </head>

  <body>
    
    <div id="wrap">
      
      <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="navbar-inner">
          <div class="container">
            <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="brand" href="/">Plan Your Picnic!</a>
            <div class="nav-collapse collapse">
              <ul class="nav">
                <li class="active"><a href="/">Plan</a></li>
                <li><a href="/about">About</a></li>
                <li><a href="/contact">Contact</a></li>
              </ul>
            </div><!--/.nav-collapse -->
          </div>
        </div>
      </div>

      <div class="container">
        <div id="map-canvas"></div>
      </div>
      <div id="push"></div>

    </div> <!-- wrap -->

    <div id="footer">
      <div class="container">
        <p class="buttons">
          <a href="#" id="BBQ" title="BBQ"><img src="assets/img/barbecue.png" class="layericon" alt="BBQ"/></a>
          <a href="#" id="seats" title="Seats"><img src="assets/img/picnic.png" class="layericon" alt="Seats"/></a>
          <a href="#" id="tables" title="Tables"><img src="assets/img/picnic.png" class="layericon" alt="Tables"/></a>
          <a href="#" id="toilets" title="Public Toilets"><img src="assets/img/toilets.png" class="layericon" alt="Public Toilets"/></a>
          <a href="#" id="playgrounds" title="Playgrounds"><img src="assets/img/playground.png" class="layericon" alt="Playground"/></a>
        </p>
      </div>
    </div>

    <script src="http://code.jquery.com/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/frontend.js"></script>
    <script>
      $(document).on('ready', function() {
      $('#map-canvas').height( $(window).height() - 120 );
      });
    </script>
  </body>
</html>
