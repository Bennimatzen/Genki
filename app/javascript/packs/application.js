// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()



require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

require("chartkick")
require("chart.js")

// External imports
import "bootstrap";
import { initUserTabs } from '../pages/user/init_user_tabs';
import { initSlider } from '../pages/user/init_slider';
// import { initChatCable } from '../channels/chat_channel';
import { initSweetalert } from '../plugins/init_sweetalert';

import mapboxgl  from 'mapbox-gl';

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';



document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  // initUserTabs();
  initSweetalert('#btn-reminder', {
  title: "Success!",
  text: "Your reminder has been successfully created.",
  icon: "success",
  button: "Great!",
  closeOnEsc: true,
  });

  const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });
    const markers = JSON.parse(mapElement.dataset.markers);
  markers.forEach((marker) => {
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .addTo(map);
  });
  const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 9, duration: 0 });
};

  if (mapElement) {
    // [ ... ]
    fitMapToMarkers(map, markers);
  }
    }
  };
  initMapbox()

  const symptomChart = document.getElementById("chart-1")
  if (symptomChart) {
    Chartkick.eachChart(chart => chart.redraw())
  }
  initSlider();
  initUserTabs();
  // initChatCable();

});
