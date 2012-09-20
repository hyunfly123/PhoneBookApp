class PhoneBook.PhoneView extends Backbone.View
  template: JST['templates/record']
  tagName: 'tr'
  isChecked: false
  initialize: ->
    this.model.on('hide', this.remove, this)
    this.model.view = this
  events:
    'change input': 'selected'
    'click button': 'edit'
  render: ->
    $(this.el).append(@template(@model.toJSON()))
  selected: (e) ->
    if ($(e.target).is(':checked')) is true
      @isChecked = true
    else
      @isChecked = false
  edit: (e) ->
    window.phonebookApp.navigate("phones/#{@model.get('id')}/edit", true)

