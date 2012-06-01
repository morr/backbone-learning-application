class App.Views.Payment extends Backbone.View
  template: JST['wizard/payment']
  className: 'b-wizard'

  events: {}
  initialize: ->

  render: ->
    @delegateEvents @events
    @$el.html @template(wizard: @model)

    $collection = @.$('#flights')
    @model.get('flights').each (flight) ->
      view = new App.Views.Flight(model: flight)
      $collection.append(view.render().el)

    $collection = @.$('#passports')
    @model.get('passports').each (passport, index) ->
      view = new App.Views.Passport(model: passport, index: index)
      $collection.append(view.render().el)

    @
