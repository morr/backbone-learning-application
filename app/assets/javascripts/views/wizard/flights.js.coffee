class App.Views.Flights extends Backbone.View
  template: JST['wizard/flights']
  className: 'b-wizard'

  initialize: ->
    @collection = new App.Collections.Flights()
    @collection.on 'reset', @render, @
    @collection.fetch()

  events:
    'flight:add': 'addFlight'
    'flight:remove': 'removeFlight'

  addFlight: (e, flight) ->
    @model.addFlight(flight)

  removeFlight: (e, flight) ->
    @model.removeFlight(flight)

  render: ->
    @delegateEvents @events
    @$el.html @template()

    selected = @model.get('flights')

    $collection = @.$('#flights')
    @collection.each (flight) =>
      view = new App.Views.Flight(model: flight, selected: selected.include(flight))
      $collection.append(view.render().el)

    @
