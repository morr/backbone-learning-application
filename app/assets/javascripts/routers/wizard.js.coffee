class App.Routers.Wizard extends Backbone.Router
  routes:
    '': 'flights',
    'flights': 'flights'
    'auth': 'auth',
    'agreement': 'agreement',
    'people': 'people',
    'payment': 'payment',
    'tickets': 'tickets'

  flights: ->
    view = new App.Views.Flights()
    $('#wizard').html view.render().el
