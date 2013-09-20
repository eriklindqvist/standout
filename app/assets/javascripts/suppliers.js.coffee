# Skapa en markör på kartan
add_marker = (location, title, content, map) ->
  marker = new google.maps.Marker {position:location, map:map, title:title}
  info = new google.maps.InfoWindow {content:content}
  google.maps.event.addListener marker, 'click', ->
     info.open map, marker

# Generera HTML-innehåll för inforutan
create_info = (title, address, zip, country, email, phone) ->
  '<div><h2>'+title+'</h2><p>'+address+'</p><p>'+zip+'</p><p>'+country+'</p><p>'+email+'</p><p>'+phone+'</p></div>'
     
# Skapa kartan
init = ->  
  bounds = new google.maps.LatLngBounds
  map = new google.maps.Map @map
    
  # Hämta lista över alla leverantörer i JSON
  $.getJSON '/suppliers.json', (data) ->
    $.each data, (key, val) ->
      address = val.address + ', ' + val.zip + ', ' + val.country
      
      # Hämta koordinater utifrån leverantörens adress 
      # TODO: Felhantering
      $.getJSON 'https://maps.googleapis.com/maps/api/geocode/json?address='+address+'&sensor=false&language=sv', (json) ->
        coordinates = json.results[0].geometry.location
        location = new google.maps.LatLng coordinates.lat, coordinates.lng
        content = create_info val.name, val.address, val.zip, val.country, val.email, val.phone
        add_marker location, val.name, content, map
        bounds.extend location
        map.fitBounds bounds
        map.panToBounds bounds

$ -> map = init()
