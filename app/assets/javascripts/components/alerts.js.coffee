window.RigPirate        = window.RigPirate || {}
window.RigPirate.Alerts = window.RigPirate.Alerts || {}

$ ->
  RigPirate.Alerts.fadeOut = ->
    $(".notifications").delay(2500).fadeOut(750)
