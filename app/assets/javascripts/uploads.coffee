tmpToolTip = (btn, message) ->
  oldTip = $(btn).attr('data-original-title')
  $(btn).attr('data-original-title', message)
  $(btn).tooltip('show').on 'hidden.bs.tooltip', (e) ->
    $(btn).attr('data-original-title', oldTip)
  setTimeout (->
    $(btn).tooltip 'hide'
  ), 1000

$ ->
  $('input[type="file"]').on 'change', ->
    fileName = $(this).val().replace(/^.*\\/, "")
    $(this).next('.custom-file-label').html fileName

  $('[data-toggle="tooltip"]').tooltip();   
  clipboard = new Clipboard('button[data-clipboard-text]')
  clipboard.on 'success', (e) ->
    tmpToolTip e.trigger, 'Copied!'
  clipboard.on 'error', (e) ->
    tmpTooltip e.trigger, 'Failed!'
