class App.Views.Agreement extends App.Views.ActStep
  template: JST['wizard/agreement']

  act: ->
    @wizard.acceptLicense()

  isActed: ->
    @wizard.isLicenseAccepted()
