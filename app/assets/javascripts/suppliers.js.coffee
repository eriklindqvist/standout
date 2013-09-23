current_info_window = null

# Skapa en markör på kartan
add_marker = (location, title, content, map, icon) ->
  marker = new google.maps.Marker {position:location, map:map, title:title, icon: icon}
  info = new google.maps.InfoWindow {content:content}
  google.maps.event.addListener marker, 'click', ->
      current_info_window.close() unless current_info_window == null
      info.open map, marker
      current_info_window = info
  
# Generera HTML-innehåll för inforutan
create_info = (title = "", address = "", zip = "", country = "", email = "", phone = "") ->
  '<div><h2>'+title+'</h2><p>'+address+'<br>'+zip+'<br>'+country+'<br><a href="mailto:'+email+'">'+email+'<br>'+phone+'</p></div>'
     
# Skapa kartan
init = ->  
  bounds = new google.maps.LatLngBounds
  map_options = {
    streetViewControl: false,
    panControl: false,
    mapTypeControl: false,
    scaleControl: false,
    zoomControlOptions: {
      style:google.maps.ZoomControlStyle.SMALL
    }
  }
  map = new google.maps.Map @map, map_options
    
  # Hämta lista över leverantören eller alla leverantörer i JSON-format
  $.getJSON $(location).attr('pathname')+'.json', (data) ->    
    $.each data, (key, val) ->
      address = val.address + ', ' + val.zip + ', ' + val.country
      
      # Hämta koordinater utifrån leverantörens adress 
      geocoder = new google.maps.Geocoder()
      geocoder.geocode address: address, (results, status) ->
        location = results[0].geometry.location
        content = create_info val.name, val.address, val.zip, val.country, val.email, val.phone
        add_marker location, val.name, content, map, val.category.icon
        bounds.extend location
        map.fitBounds bounds
        map.panToBounds bounds

$ -> init()
