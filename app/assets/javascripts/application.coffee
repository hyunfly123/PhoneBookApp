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
    window.phoneCollection = new PhoneBook.Phones()
    window.phoneCollectionView = new PhoneBook.PhoneCollectionView({ collection: window.phoneCollection })
    $('body').html(window.bookCoverView.render())
    $('#phoneTable').append(window.phoneCollectionView.render())
    $('#addPhone').click @add
    $('#clearPhone').click @clear
    $('#removePhone').click @remove
    @start

  routes:
    '':    'index' 
    'phones/:id': 'show'
  
  index: ->
  
  show: (id) ->
    @collection.get(id)
    
        
  start: ->
    Backbone.history.start({ pushState: true })
  
  add: ->
    data = 
      last_name: $('#lastName').val()
      first_name: $('#firstName').val()
      number: $('#phoneNum').val()
      address: $('#address').val()
      comments: $('#comments').val()

    phoneModel = new PhoneBook.Phone data
    phoneModel.save()
    window.phoneCollection.add(phoneModel)
    
  
  clear: ->
    window.phoneCollectionView.removeAllPhones()
    
  remove: ->
    window.phoneCollectionView.removeSelected()
  
  
    
    

window.phonebookApp = new window.PhoneBookApp()
window.phoneCollection.fetch()
