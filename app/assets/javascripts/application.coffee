#= require jquery
#= require jquery_ujs
#= require backbone-rails

#= require_tree ./shared
#= require_tree ./models
#= require_tree ./collections
#= require_tree ./templates
#= require_tree ./views

#= require-self



class window.PhoneBookApp extends Backbone.Router
  initialize: ->


  routes:
    '':    'index'

  index: ->

    
  start: ->
    Backbone.history.start({pushState: true})
    alert "Router Start"
    

window.phonebookApp = new window.PhoneApp
$( -> window.phonebookApp.start())
