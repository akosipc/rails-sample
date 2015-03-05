window.RigPirate            = window.RigPirate || {}
window.RigPirate.Autoexpand = window.RigPirate.Autoexpand || {}

$ ->
  RigPirate.Autoexpand.init = ->
    $("[role='autoexpand']").autoexpand({extraLines: 3})
    $("[role='autoexpand-small']").autoexpand({extraLines: 0})


