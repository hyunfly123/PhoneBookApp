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
    window.bookCoverView = new PhoneBook.PhoneCoverView()

  routes:
    '':    'index'

  index: ->
    $('body').html(window.bookCoverView.render())
    
  start: ->
    Backbone.history.start({ pushState: true })
    

window.phonebookApp = new window.PhoneBookApp
$( -> window.phonebookApp.start())
