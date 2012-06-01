class App.Views.Passports extends Backbone.View
  template: JST['wizard/passports']

  events:
    'click .append': 'new'
    'passport:remove': 'remove'

  initialize: (wizard) ->
    @wizard = wizard
    _.bindAll this, 'append'

    @collection = @wizard.get 'passports'

  render: ->
    @delegateEvents @events
    @$el.html @template()

    @$collection = @.$('#collection')
    @collection.each @append
    @

  new: ->
    passport = new App.Models.Passport()
    @collection.add passport
    @append(passport)

  append: (passport) ->
    view = new App.Views.Passport(model: passport)
    @$collection.append(view.render().el)

  remove: (e, passport) ->
    @collection.remove passport
