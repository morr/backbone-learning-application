class App.Views.Payment extends Backbone.View
  template: JST['wizard/payment']

  events: {}
  initialize: ->

  render: ->
    @delegateEvents @events
    @$el.html @template(wizard: @model)
    @
