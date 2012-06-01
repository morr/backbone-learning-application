class App.Views.Flight extends Backbone.View
  template: JST['wizard/flight']
  tagName: 'tr'
  className: 'details'

  events:
    'click': 'select'

  render: ->
    $(@el).html @template(entry: @model)
    @

  select: ->
    unless @.$el.hasClass 'selected'
      @.$el.addClass 'selected'
      @.$el.trigger 'flight:add', [@model]
    else
      @.$el.removeClass 'selected'
      @.$el.trigger 'flight:remove', [@model]
