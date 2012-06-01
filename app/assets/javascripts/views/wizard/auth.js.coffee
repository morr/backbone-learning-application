class App.Views.Auth extends App.Views.ActStep
  template: JST['wizard/auth']

  act: ->
    @model.authorize()

  isActed: ->
    @model.isAuthorized()
