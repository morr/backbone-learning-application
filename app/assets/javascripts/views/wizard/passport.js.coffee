class App.Views.Passport extends Backbone.View
  template: JST['wizard/passport']
  tagName: 'tr'
  className: 'row'

  events:
    'change input': 'update'
    'click .delete': 'delete'
    'click .edit': 'edit'
    'click .apply': 'apply'

  render: ->
    @delegateEvents @events
    @$el.html @template(entry: @model, edit: @options.edit)
    @

  update: (e) ->
    $target = $(e.target)
    @model.set $target.attr('name'), $target.val()

  delete: (e) ->
    @$el.trigger('passport:remove', @model)
    @$el.remove()

  edit: ->
    @$el.html @template(entry: @model, edit: true, apply_button: true)

  apply: ->
    @$el.html @template(entry: @model)
