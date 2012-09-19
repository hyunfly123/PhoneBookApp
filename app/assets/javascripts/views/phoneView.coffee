class PhoneBook.PhoneView extends Backbone.View
  template: JST['templates/record']
  initialize: ->
    
    

  render: ->
    $(this.el).html(@template)
    $("body").html(this.el)

