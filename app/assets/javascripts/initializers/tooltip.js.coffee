window.RigPirate          = window.RigPirate || {}
window.RigPirate.Tooltip  = window.RigPirate.Tooltip || {}

$ ->
  RigPirate.Tooltip.init = ->
    $("[data-toggle='tooltip']").tooltip()

