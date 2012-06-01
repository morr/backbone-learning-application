class App.Views.Wizard extends Backbone.View
  template: JST['wizard/wizard']
  steps: [
    { index: 1, name: 'Данные перелёта', template: 'wizard/travels' },
    { index: 2, name: 'Авторизация', template: 'wizard/auth' },
    { index: 3, name: 'Договор', template: 'wizard/agreement' },
    { index: 4, name: 'Паспорта', template: 'wizard/people' },
    { index: 5, name: 'Оплата', template: 'wizard/payment' },
    { index: 6, name: 'Билеты', template: 'wizard/tickets' }
  ]

  render: ->
    $(@el).html @template(steps: @steps)
    @
