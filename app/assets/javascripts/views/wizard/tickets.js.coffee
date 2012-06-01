class App.Views.Tickets extends Backbone.View
  template: JST['wizard/tickets']
  className: 'b-wizard'

  render: ->
    @delegateEvents @events
    $(@el).html @template(entry: @model)
    @
