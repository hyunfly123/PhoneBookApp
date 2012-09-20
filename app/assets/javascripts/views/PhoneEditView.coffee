class PhoneBook.PhoneEditView extends Backbone.View
  template: JST['templates/recordEdit']
  render: ->
    $(this.el).html(@template)
 
 

