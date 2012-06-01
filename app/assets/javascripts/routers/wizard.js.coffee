class App.Routers.Wizard extends Backbone.Router
  initialize: (model, view) ->
    @model = model
    @view = view

  routes:
    '': 'flights',
    'flights': 'flights'
    'auth': 'auth',
    'agreement': 'agreement',
    'passports': 'passports',
    'payment': 'payment',
    'tickets': 'tickets'

  flights: ->
    @view.showStep 0

  auth: ->
    @view.showStep 1

  agreement: ->
    @view.showStep 2

  passports: ->
    @view.showStep 3

  payment: ->
    @view.showStep 4

  tockets: ->
    @view.showStep 5
