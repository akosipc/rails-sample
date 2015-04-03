window.RigPirate           = window.RigPirate || {}
window.RigPirate.Messages  = window.RigPirate.Messages || {}

$ ->
  RigPirate.Messages.display = (status, message) ->
    template = "
      <div class='alert alert-dismissable notifications alert-#{status}'>
        <button class='close' aria-hidden='true' data-dismiss='alert' type='button'> &times; </button>
        <div>
          #{message}
        </div>
      </div>"

    $($("body").children()[0]).before(template)




