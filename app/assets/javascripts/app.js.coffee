window.App =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    @Routers.Wizard = new App.Routers.Wizard()
    @Models.Wizard = new App.Models.Wizard()
    @Views.Wizard = new App.Views.Wizard()

    $('#container').html @Views.Wizard.render().el
    Backbone.history.start()

$ ->
  App.init()
