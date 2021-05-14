<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Map</title>

    <style type="text/css">
      /* Set the size of the div element that contains the map */
      #map {
        height: 320px;
        /* The height is 400 pixels */
        width: 100%;
        /* The width is the width of the web page */
      }
    </style>
    <script>
      // Initialize and add the map
      function initMap() {
        // The location of Uluru
        const uluru = { lat: 37.59718859245731, lng: 127.08772438293829 };
        // The map, centered at Uluru
        const map = new google.maps.Map(document.getElementById("map"), {
          zoom: 17,
          center: uluru,
        });
        // The marker, positioned at Uluru
        const marker = new google.maps.Marker({
          position: uluru,
          map: map,
        });
      }
    </script>
  </head>
  <body>
    <h3>찾아오시는길</h3>
    <!--The div element for the map -->
    <div id="map"></div>

    <!-- Async script executes immediately and must be after any DOM elements used in callback. -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCWSGlSD9FCJzQHpuxt268S8zifxT7EBLc&callback=initMap&libraries=&v=weekly"
      async ></script>
  </body>
</html>