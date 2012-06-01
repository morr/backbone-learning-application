class App.Views.Agreement extends Backbone.View
  template: JST['wizard/agreement']

  render: ->
    $(@el).html @template(entry: @model)
    @
