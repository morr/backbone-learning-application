class App.Views.Auth extends Backbone.View
  template: JST['wizard/auth']

  render: ->
    $(@el).html @template(entry: @model)
    @
