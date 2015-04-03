window.RigPirate             = window.RigPirate || {}
window.RigPirate.ContactForm = window.RigPirate.ContactForm || {}

$ ->
  RigPirate.ContactForm.init = ->
    form        = $("[role='contact-form']")

    form.on "submit", (event) ->
      event.preventDefault()

      $.ajax
        type:       "POST"
        url:        "//formspree.io/adrianpetersonco@gmail.com"
        dataType:   "json"
        data:       form.serialize()
        success:    (response) ->
          if response.hasOwnProperty("success")
            RigPirate.Messages.display "success", "Your e-mail has been sent. We will reply to you shortly."

