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

  render: ->
    $(@el).html @template(entries: @collection)

    $flights = @.$('#flights')
    @collection.each (flight) ->
      view = new App.Views.Flight(model: flight)
      $flights.append(view.render().el)
    @

  addFlight: (e, flight) ->
    @wizard.addFlight(flight)

  removeFlight: (e, flight) ->
    @wizard.removeFlight(flight)
