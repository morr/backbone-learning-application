window.App =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    window.wizard = wizard = new App.Models.Wizard()
    router = new App.Routers.Wizard(wizard)
    view = new App.Views.Wizard(wizard)

    $('#container').html view.render().el
    Backbone.history.start()

$ ->
  App.init()
