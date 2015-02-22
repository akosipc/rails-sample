window.RigPirate      = window.RigPirate || {}
window.RigPirate.Tags = window.RigPirate.Tags|| {}

$ ->
  RigPirate.Tags.init = ->
    $("[role='tagsinput']").chosen()

