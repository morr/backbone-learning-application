class App.Views.Tickets extends Backbone.View
  template: JST['wizard/tickets']

  render: ->
    $(@el).html @template(entry: @model)
    @
