class App.Views.Agreement extends App.Views.ActStep
  template: JST['wizard/agreement']

  act: ->
    @model.acceptLicense()

  isActed: ->
    @model.isLicenseAccepted()
