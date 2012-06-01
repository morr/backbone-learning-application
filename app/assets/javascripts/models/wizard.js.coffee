class App.Models.Wizard extends Backbone.Model
  flights: {}

  addFlight: (flight) ->
    @flights[flight.get('id')] = flight

  removeFlight: (flight) ->
    delete @flights[flight.get('id')]
