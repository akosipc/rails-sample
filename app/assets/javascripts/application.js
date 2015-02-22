//= require jquery
//= require jquery_ujs
//= require jquery.autoexpand
//= require chosen-jquery
//= require bootstrap-sprockets
//= require bootstrap/alert
//= require bootstrap/modal
//= require components/alerts
//= require components/modals
//= require history_native_html5
//= require underscore.min
//= require gmaps/google
//= require_tree ./initializers
//= require_tree .

$(function(){
  RigPirate.Autoexpand.init()
  RigPirate.Tags.init()
})
