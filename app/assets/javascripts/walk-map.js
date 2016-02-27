mapboxgl.accessToken = 'pk.eyJ1IjoicmFuZG9td2FsayIsImEiOiJjaWw0Y3B5dzEwMjl1dGhseXcyOWh5NGJpIn0.ZKl7LVbPulKaAqQjbsMJfQ';
var map = new mapboxgl.Map({
    container: 'map', // container id
    style: 'mapbox://styles/mapbox/streets-v8', //stylesheet location
    center: [-74.50, 40], // starting position
    zoom: 9 // starting zoom
});