class PhoneBook.PhoneCollectionView extends Backbone.View
  tagName: 'tbody'
  initialize: ->
    @collection.on('add', @addPhone, this)
    @collection.on('reset', @addAllPhones, this)
    @collection.on('remove', @destroyPhone, this)
    if @collection.length is 0
      @isEmpty = true
    else
      @isEmpty = false
    
  render: ->
    $(this.el).html('')
    @addAllPhones()
    $(this.el)
  
  addPhone: (phone) ->
    if @isEmpty is true
      $(this.el).html('<tr><th/><th>Last Name</th><th>First Name</th><th>Phone #</th><th>Address</th><th>Comments</th></tr>')
    phoneView = new PhoneBook.PhoneView({ model: phone })
    $(this.el).append(phoneView.render())
    @isEmpty = false;
    
  addAllPhones: ->
    @collection.forEach(@addPhone, this)
  
  removeAllPhones: ->
    @collection.remove @collection.map (phone) -> phone
    
  
  destroyPhone: (phone) ->
    phone.destroy
      success: =>
        if @collection.length is 0
          $(this.el).html('No Phone Record!!')
          @isEmpty = true
        else
          @isEmpty = false
          
          
  
  removeSelected: ->
    @collection.remove @collection.map (phone) -> if phone.view.isChecked is true then phone
