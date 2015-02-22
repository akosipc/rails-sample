window.RigPirate        = window.RigPirate || {}
window.RigPirate.Modals = window.RigPirate.Modals || {}

$ ->
  RigPirate.Modals.close = ->
    elements = $("[data-dismiss='modal']")

    elements.click (event) ->
      History.go(-1)

  RigPirate.Modals.watch = ->
    elements = $("[role='history-trigger']")

    elements.click (event) ->
      event.preventDefault()
      History.pushState(null, null, @href)

      $.ajax
        url:    @href,
        type:   "get",
        success: (data) ->
          $("#modal .modal-dialog").html(data)

