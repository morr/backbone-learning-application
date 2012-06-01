window.App =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    model = new App.Models.Wizard()
    router = new App.Routers.Wizard(model)
    view = new App.Views.Wizard()

    $('#container').html view.render().el
    Backbone.history.start()

$ ->
  App.init()
