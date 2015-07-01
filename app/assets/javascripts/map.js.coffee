module.exports = (x)->

  $listContainer = $('.map ul.list')
  groups = []

  activeWindow = null
  placeMarkers = (markerGroups, map)->
    markers = []
    # geocoder = new google.maps.Geocoder()
    for group in markerGroups
      group.markerObjs = []
      for marker in group.markers
        gMarker = new google.maps.Marker
          map: map
          position: {lat: parseFloat(marker.latitude), lng: parseFloat(marker.longitude)}
          icon: marker.icon.url
          title: marker.title
        content = "<div style='height:70px'>"
        content += "<h3>#{marker.title}</h3>"
        content += "#{marker.address}, #{marker.city}</div>"
        for photo in marker.marker_photos
          content += "<a href='#{photo.photo.url}' target='_blank'>"
          content += "<img src='#{photo.photo.thumb.url}' alt='#{photo.title}' class='small-photo' />"
          content += "</a>"
        bindInfoWindow(gMarker, map, content)
        group.markerObjs.push(gMarker)

  bindInfoWindow = (marker, map, content) ->
    infowindow = new google.maps.InfoWindow
      content: content
    google.maps.event.addListener marker, 'click', ->
      console.log activeWindow
      activeWindow.close() if activeWindow?
      infowindow.open map, marker
      activeWindow = infowindow
      map.panTo marker.position

  showAllMarkers = (markerGroups, show=true )->
    for group in markerGroups
      for marker in group.markerObjs
        marker.setVisible(show)

  buildList = (markerGroups)->
    $listContainer.find('.item').remove()
    for group, n in markerGroups
      li = $('<li>').addClass('item')
      li.text(group.title)
      li.prepend($('<i>').css('background', group.color))
      li.data('group', n)
      $listContainer.append(li)

  showGroup = (groups, groupId)->
    for marker in groups[groupId].markerObjs
      marker.setVisible(true)

  groupSelectedEvent = (e)->
    item = $(e.target)
    $listContainer.find('li').removeClass('active')
    item.addClass('active')
    showAllMarkers(groups, false)
    showGroup(groups, item.data('group'))

  showAllSelectedEvent = (e)->
    item = $(e.target)
    $listContainer.find('li').removeClass('active')
    item.addClass('active')
    showAllMarkers(groups, true)

  initEvents = ->
    $listContainer.on 'click', 'li.item', groupSelectedEvent
    $listContainer.on 'click', 'li.all', showAllSelectedEvent

  initialize = ->
    mapCanvas = document.getElementById("map-container")
    mapOptions =
      center: new google.maps.LatLng(48.92143799999999, 24.712647400000037)
      zoom: 16
      scrollwheel: false
      mapTypeId: google.maps.MapTypeId.ROADMAP
      disableDefaultUI: true
      zoomControl: true
      zoomControlOptions:
        position: google.maps.ControlPosition.LEFT_CENTER
        # style: google.maps.ZoomControlStyle.SMALL
    map = new google.maps.Map(mapCanvas, mapOptions)
    xhr = $.get('/markers')
    xhr.done (data)=>
      groups = data

      buildList(groups)
      placeMarkers(groups, map)
      initEvents()

  google.maps.event.addDomListener window, "load", initialize if window.google
