window.App =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    wizard = new App.Models.Wizard()
    view = new App.Views.Wizard(model: wizard)
    router = new App.Routers.Wizard(wizard, view)

    $('#container').html view.render().el
    #Backbone.history.start(pushState: (typeof history.pushState == "function" ? true : false), root: '/wizard/')
    Backbone.history.start(pushState: true, root: '/wizard/')

$ ->
  App.init()
