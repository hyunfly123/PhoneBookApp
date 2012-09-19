class PhoneBook.PhoneCollectionView extends Backbone.View
  tagName: 'tbody'
  initialize: ->
    $(this.el).append('<tr><th/><th>Last Name</th><th>First Name</th><th>Phone #</th><th>Address</th><th>Comments</th></tr>')
    @collection.on('add', @addPhone, this)
    @collection.on('reset', @addAllPhones, this)
    @collection.on('remove', @destroyPhone, this)
    
  render: ->
    @addAllPhones()
    $(this.el)
  
  addPhone: (phone) ->
    phoneView = new PhoneBook.PhoneView({ model: phone })
    $(this.el).append(phoneView.render())
    
  addAllPhones: ->
    @collection.forEach(@addPhone, this)
  
  removeAllPhones: ->
    @collection.remove @collection.map (phone) -> phone
  
  destroyPhone: (phone) ->
    phone.destroy()  
  
  removeSelected: ->
    @collection.remove @collection.map (phone) -> if phone.view.isChecked is true then phone
