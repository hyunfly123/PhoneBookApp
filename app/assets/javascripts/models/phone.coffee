class PhoneBook.Phone extends Backbone.Model
  urlRoot: '/phones'
  defaultErrorHandler: (model, error) ->
    alert "DD"
  