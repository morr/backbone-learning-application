window.App =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    model = new App.Models.Wizard()
    view = new App.Views.Wizard(model)
    router = new App.Routers.Wizard(model, view)

    $('#container').html view.render().el
    Backbone.history.start()

$ ->
  App.init()
