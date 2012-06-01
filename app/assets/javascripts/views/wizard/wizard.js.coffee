class App.Views.Wizard extends Backbone.View
  template: JST['wizard/wizard']

  events:
    'click #navigation .active': 'goToStep'

  initialize: ->
    _.bindAll(@, 'updateNavigation')
    @model.on 'change', @updateNavigation

  render: ->
    @delegateEvents @events
    @$el.html @template(steps: @steps)

    # привязка узлов навигации к @steps
    @.$('#navigation .step').each (index,node) =>
      $node = $(node)
      @steps[$node.data('key')].$node = $node
    @

  goToStep: (e) ->
    Backbone.history.navigate e.step || $(e.currentTarget).data('key'), { trigger: true }

  showStep: (key) ->
    step = @steps[key]

    unless step && step.isValid(@model)
      @goToStep step: _.first(_.keys(@steps))
      return

    view = if step.view
      step.view
    else
      step.view = new step.klass(model: @model)

    @.$('#wizard').html view.render().el
    @updateNavigation()

  updateNavigation: ->
    for key, step of @steps
      if step.isValid(@model)
        step.$node.addClass('active')
      else
        step.$node.removeClass('active')

  steps:
    flights:
      index: 0
      name: 'Данные перелёта'
      $node: null
      klass: App.Views.Flights
      isValid: (wizard) ->
        true
    auth:
      index: 1
      name: 'Авторизация'
      $node: null
      klass: App.Views.Auth
      isValid: (wizard) ->
        wizard.hasFlights()
    agreement:
      index: 2
      name: 'Договор'
      $node: null
      klass: App.Views.Agreement
      isValid: (wizard) ->
        wizard.isAuthorized()
    passports:
      index: 3
      name: 'Паспорта'
      $node: null
      klass: App.Views.Passports
      isValid: (wizard) ->
        wizard.isLicenseAccepted()
    payment:
      index: 4
      name: 'Оплата'
      $node: null
      klass: App.Views.Payment
      isValid: (wizard) ->
        wizard.hasPassports()
    tickets:
      index: 5
      name: 'Билеты'
      $node: null
      klass: App.Views.Tickets
      isValid: (wizard) ->
        wizard.isPaid()
