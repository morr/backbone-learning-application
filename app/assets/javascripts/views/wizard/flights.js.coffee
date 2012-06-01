class App.Views.Flights extends Backbone.View
  template: JST['wizard/flights']

  initialize: ->
    @collection = new App.Collections.Flights()
    @collection.on 'reset', @render, @
    @collection.fetch()

  events:
    'click .b-ticket .details': 'select_flight'

  render: ->
    $(@el).html @template(entries: @collection)
    @

  select_flight: ->
    console.log(this)
