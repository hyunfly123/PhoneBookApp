class PhoneBook.PhoneCoverView extends Backbone.View
  template: JST['templates/bookCover']

  render: ->
    $(this.el).html(@template)
 

