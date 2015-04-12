window.RigPirate      = window.RigPirate || {}
window.RigPirate.Tab  = window.RigPirate.Tab || {}

$ ->
  RigPirate.Tab.init = ->
    elements = $("[role='tab-trigger']")

    elements.click (event) ->
      $("[href='#available']").trigger("click")


