class App.Routers.Wizard extends Backbone.Router
  initialize: (wizard) ->
    @wizard = wizard

  routes:
    '': 'flights',
    'flights': 'flights'
    'auth': 'auth',
    'agreement': 'agreement',
    'people': 'people',
    'payment': 'payment',
    'tickets': 'tickets'

  flights: ->
    view = new App.Views.Flights(@wizard)
    $('#wizard').html view.render().el
