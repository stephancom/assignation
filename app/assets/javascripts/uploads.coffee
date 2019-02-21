$ ->
  $('input[type="file"]').on 'change', ->
    fileName = $(this).val().replace(/^.*\\/, "")
    $(this).next('.custom-file-label').html fileName

  $('button[data-copy]').on 'click', ->
    url = $(this).attr('data-copy')
    # TODO: make copy to clipboard work
    document.execCommand('copy')
    # TODO: handle errors
