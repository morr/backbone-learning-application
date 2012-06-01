class App.Views.Passport extends Backbone.View
  template: JST['wizard/passport']
  tagName: 'tr'
  className: 'row'

  events:
    'change input': 'update'
    'click .delete': 'delete'
    'click .edit': 'edit'
    'click .apply': 'apply'

  initialize: ->
    # из-за 8 ослика надо клас руками проставлять, вместо стиля в css
    @$el.addClass('odd') unless @options.index%2

  render: ->
    @delegateEvents @events
    @$el.html @template(entry: @model, edit: @options.edit)
    @

  update: (e) ->
    $target = $(e.target)
    @model.set $target.attr('name'), $target.val()

  delete: (e) ->
    $siblings = @$el.siblings()

    @$el.trigger('passport:remove', @model)
    @$el.remove()

    $siblings.removeClass('odd')
             .each (index, node) ->
               $(node).addClass('odd') unless index%2

  edit: ->
    @$el.html @template(entry: @model, edit: true, apply_button: true)

  apply: ->
    @$el.html @template(entry: @model)
