class App.Models.Wizard extends Backbone.Model
  initialize: ->
    flights = new App.Collections.Flights()
    passports = new App.Collections.Passports()

    flights.on 'add', => @trigger 'change'
    flights.on 'remove', => @trigger 'change'

    passports.on 'add', => @trigger 'change'
    passports.on 'remove', => @trigger 'change'

    @set 'flights', flights
    @set 'passports', passports
    @set 'authorized', false
    @set 'license_accepted', false
    @set 'paid', false

    @set 'number', '234567'
    @set 'manager', 'Пока неизвестен'
    @set 'status', 'В процессе бронирования'

  addFlight: (flight) ->
    flights = @get 'flights'
    flights.add(flight)

  removeFlight: (flight) ->
    flights = @get 'flights'
    flights.remove(flight)

  hasFlights: ->
    @get('flights').length

  isAuthorized: ->
    @get('authorized')

  isLicenseAccepted: ->
    @get('license_accepted')

  hasPassports: ->
    @get('passports').length

  isPaid: ->
    @get('paid')

  authorize: ->
    @set 'authorized', true

  acceptLicense: ->
    @set 'license_accepted', true

  makePayment: ->
    @set 'paid', true

  cost: ->
    @get('flights').reduce (rez,v) ->
      rez += v.get('cost')
    , 0
