module.exports = (x)->

  (initVideoPopup = ->
    $videoContainer = $('#player')

    $(document).on 'click', 'a.yt-video', (e)->
      e.preventDefault()
      $('.tooltipstered').tooltipster 'hide'
      vl = $(this).attr "href"
      $youtubeVideo = $('<iframe height="315" width="560" src="' + vl + '" frameborder="0" allowfullscreen></iframe>')
      $videoContainer.html $youtubeVideo
      location.hash = '#video-player'

    $('.video-overlay, .video-overlay .close').on 'click', (e)->
      $videoContainer.html ""
      location.hash = ''
  )()



  $('.overlay .back').on 'click', ->
    window.history.back()

  $('form.business, form.people').on 'submit', (e)->
    e.preventDefault()
    form = $(e.currentTarget)
    data = form.serialize()
    action = form.prop('action')
    xhr = $.post( action, data )
    xhr.always ->
      location.hash = '#success-step'

  showBackButtonIfNeed = ($overlay) ->
    $btn = $overlay.find('.back')
    if location.hash is '#step1'
      $btn.hide()
    else
      $btn.show()


  handleHashChange = ->
    hash = location.hash

    elSelector = '.js-' + hash.slice(1)

    if hash and $(elSelector).length
      $el = $(elSelector)

      $overlay = $el.parents('.overlay')

      showBackButtonIfNeed($overlay)

      visibleStep = $overlay.find('.steps[style*="display: block;"]')

      if visibleStep.length
        visibleStep.fadeOut 'fast', -> $el.fadeIn 'fast'
      else
        $el.fadeIn 'fast'

      $overlay.addClass('visible')
      $('html').addClass('with-overlay')

    else
      $('.overlay').removeClass('visible')
      $('html').removeClass('with-overlay')


  handleHashChange()
  window.onhashchange = handleHashChange
