class App.Views.Payment extends Backbone.View
  template: JST['wizard/payment']

  render: ->
    $(@el).html @template(entry: @model)
    @
