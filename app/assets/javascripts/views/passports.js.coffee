class App.Views.Passports extends Backbone.View
  template: JST['wizard/passports']

  render: ->
    $(@el).html @template(entry: @model)
    @
