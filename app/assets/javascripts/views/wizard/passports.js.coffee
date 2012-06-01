class App.Views.Passports extends Backbone.View
  template: JST['wizard/passports']
  className: 'b-wizard'

  events:
    'click .append': 'new'
    'passport:remove': 'remove'

  initialize: ->
    _.bindAll this, 'append'

    @collection = @model.get 'passports'

  render: ->
    @delegateEvents @events
    @$el.html @template()

    @$collection = @.$('#passports')
    @collection.each @append
    @

  new: ->
    passport = new App.Models.Passport()
    @collection.add passport
    @append(passport, @collection.length - 1)

  append: (passport, index) ->
    view = new App.Views.Passport(model: passport, edit: true, index: index)
    @$collection.append(view.render().el)

  remove: (e, passport) ->
    @collection.remove passport
