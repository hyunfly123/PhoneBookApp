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
    window.bookEditView = new PhoneBook.PhoneEditView()
    window.phoneCollection = new PhoneBook.Phones()
    window.phoneCollectionView = new PhoneBook.PhoneCollectionView({ collection: window.phoneCollection })
    $('body').html(window.bookCoverView.render())
    $('#phoneTable').html(window.phoneCollectionView.render())
    @start()

  routes:
    '' :    'main'
    'phones/:id/edit' : 'edit'
  
  main: ->
    $('body').html(window.bookCoverView.render())
    $('#phoneTable').html(window.phoneCollectionView.render())
    $('#addPhone').click => @add()
    $('#clearPhone').click => @clear()
    $('#removePhone').click => @remove()
    
  edit: (id) ->
    $('body').html(window.bookEditView.render())
    @currentPhone = window.phoneCollection.get(id)
    @populatePhone()
    $('#apply').click => @update()
    $('#home').click => @backHome()
    
  backHome: ->
    window.phonebookApp.navigate('/', true)
   
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
    
  update: ->
    @currentPhone.set('last_name', $('#lastName').val())
    @currentPhone.set('first_name', $('#firstName').val())
    @currentPhone.set('number', $('#phoneNum').val())
    @currentPhone.set('address', $('#address').val())
    @currentPhone.set('comments', $('#comments').val())
    
    @currentPhone.save()
    window.phonebookApp.navigate('/', true)
    
  
  clear: ->
    window.phoneCollectionView.removeAllPhones()
    
  remove: ->
    window.phoneCollectionView.removeSelected()
    
  populatePhone: ->
    $('#lastName').text(@currentPhone.get('last_name'))
    $('#firstName').text(@currentPhone.get('first_name'))
    $('#phoneNum').text(@currentPhone.get('number'))
    $('#address').text(@currentPhone.get('address'))
    $('#comments').text(@currentPhone.get('comments'))
  
  
    
    

window.phonebookApp = new window.PhoneBookApp()
window.phoneCollection.fetch()
