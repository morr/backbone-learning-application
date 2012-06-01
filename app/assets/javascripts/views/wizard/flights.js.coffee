class App.Views.Flights extends Backbone.View
  template: JST['wizard/flights']

  initialize: (wizard) ->
    @wizard = wizard

    @collection = new App.Collections.Flights()
    @collection.on 'reset', @render, @
    @collection.fetch()

  events:
    'flight:add': 'addFlight'
    'flight:remove': 'removeFlight'

  addFlight: (e, flight) ->
    @wizard.addFlight(flight)

  removeFlight: (e, flight) ->
    @wizard.removeFlight(flight)

  render: ->
    @delegateEvents @events
    @$el.html @template()

    selected = @wizard.get('flights')

    $collection = @.$('#collection')
    @collection.each (flight) ->
      view = new App.Views.Flight(model: flight, selected: selected.include(flight))
      $collection.append(view.render().el)

    @
