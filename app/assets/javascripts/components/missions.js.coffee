window.RigPirate          = window.RigPirate || {}
window.RigPirate.Missions = window.RigPirate.Missions || {}

$ ->
  RigPirate.Missions.catchImageErrors = (element) ->
    $(element).replaceWith("<a href=#{$(element).attr('src')}>Download</a>")

