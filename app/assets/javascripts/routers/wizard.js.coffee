class App.Routers.Wizard extends Backbone.Router
  initialize: (model, view) ->
    @model = model
    @view = view

  routes:
    ':step': 'step'

  step: (step) ->
    @view.showStep step
