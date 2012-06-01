class App.Views.Payment extends App.Views.ActStep
  template: JST['wizard/payment']

  act: ->
    @wizard.makePayment()

  isActed: ->
    @wizard.isPaid()
