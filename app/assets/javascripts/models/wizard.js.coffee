class App.Models.Wizard extends Backbone.Model
  initialize: ->
    @set 'flights', new App.Collections.Flights()
    @set 'passports', new App.Collections.Passports()
    @set 'authorized', false
    @set 'license_accepted', false
    @set 'paid', false

  addFlight: (flight) ->
    flights = @get 'flights'
    flights.add(flight)
    @trigger 'change'

  removeFlight: (flight) ->
    flights = @get 'flights'
    flights.remove(flight)
    @trigger 'change'

  hasFlights: ->
    @get('flights').length

  isAuthorized: ->
    @get('authorized')

  isLicenseAccepted: ->
    @get('authorized')

  hasPassports: ->
    @get('passports').length

  isPaid: ->
    @get('paid')
