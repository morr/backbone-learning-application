class App.Views.ActStep extends Backbone.View
  initialize: (wizard) ->
    @wizard = wizard

  events:
    'click .act': 'doAct'

  render: ->
    @delegateEvents @events

    $(@el).html @template(entry: @model)
    @checkAct()
    @

  doAct: ->
    @act()
    @checkAct()

  checkAct: ->
    @.$('.action').children().hide()
    if @isActed()
      @.$('.acted').show()
    else
      @.$('.act').show()


