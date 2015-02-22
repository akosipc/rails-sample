window.RigPirate        = window.RigPirate || {}
window.RigPirate.Alerts = window.RigPirate.Alerts || {}

$ ->
  RigPirate.Alerts.fadeOut = ->
    $(".alert").delay(2500).fadeOut(750)
