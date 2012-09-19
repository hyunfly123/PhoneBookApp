class PhoneBook.Phones extends Backbone.Collection
  model: PhoneBook.Phone
  url: '/phones'
  initialize: ->
    this.on('remove', @hidePhone)
  hidePhone: (phone) ->
    phone.trigger('hide')