window.App =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    window.wizard = model = new App.Models.Wizard()
    view = new App.Views.Wizard(null, model)
    router = new App.Routers.Wizard(model, view)

    $('#container').html view.render().el
    Backbone.history.start(pushState: true, root: '/wizard/')

$ ->
  App.init()
