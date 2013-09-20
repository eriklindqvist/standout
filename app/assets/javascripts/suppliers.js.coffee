# Skapa en markör på kartan
add_marker = (latitude, longitude, title, content, map) ->
  location = new google.maps.LatLng(latitude, longitude);
  marker = new google.maps.Marker({position:location, map:map, title:title});
  info = new google.maps.InfoWindow({content:content});
  google.maps.event.addListener marker, 'click', ->
     info.open(map, marker); 

# Generera HTML-innehåll för inforutan
create_info = (title, address, zip, country, email, phone) ->
  '<div><h2>'+title+'</h2><p>'+address+'</p><p>'+zip+'</p><p>'+country+'</p><p>'+email+'</p><p>'+phone+'</p></div>'
     
# Skapa kartan
init = ->
  location = new google.maps.LatLng(56.878291,14.803903);
  options = {center: location, zoom: 13}
  map = new google.maps.Map(@map, options);
  content = '<div><h2>Standout AB</h2><p>Västergatan 6</p></div>'
  add_marker 56.878291, 14.803903, 'Home', content, map
  
  # Hämta lista över alla leverantörer i JSON
  $.getJSON '/suppliers.json', (data) ->
    $.each data, (key, val) ->
      address = val.address + ', ' + val.zip + ', ' + val.country
      
      # Hämta koordinater utifrån leverantörens adress 
      # TODO: Felhantering
      $.getJSON 'https://maps.googleapis.com/maps/api/geocode/json?address='+address+'&sensor=false&language=sv', (json) ->
        location = json.results[0].geometry.location
        content = create_info val.name, val.address, val.zip, val.country, val.email, val.phone
        add_marker location.lat, location.lng, val.name, content, map
        
$ -> map = init()
