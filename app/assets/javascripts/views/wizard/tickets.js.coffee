class App.Views.Tickets extends Backbone.View
  template: JST['wizard/tickets']

  render: ->
    @delegateEvents @events
    $(@el).html @template(entry: @model)
    @
