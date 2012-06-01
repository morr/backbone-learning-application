class App.Views.Passport extends Backbone.View
  template: JST['wizard/passport']
  tagName: 'tr'
  className: 'row'

  events:
    'change input': 'update'
    'click .delete': 'delete'

  render: ->
    @delegateEvents @events
    @$el.html @template(entry: @model)
    @

  update: (e) ->
    $target = $(e.target)
    @model.set $target.attr('name'), $target.val()

  delete: (e) ->
    @.$el.trigger('passport:remove', @model)
    @$el.remove()
