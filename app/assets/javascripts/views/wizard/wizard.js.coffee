class App.Views.Wizard extends Backbone.View
  template: JST['wizard/wizard']

  events:
    'click #navigation .active': 'goToStep'

  initialize: (param, wizard) ->
    _.bindAll(@, 'updateNavigation')
    @wizard = wizard
    @wizard.on 'change', @updateNavigation

  goToStep: (e) ->
    Backbone.history.navigate e.step || $(e.currentTarget).data('key'), { trigger: true }

  showStep: (key) ->
    step = @steps[key]

    unless step && step.isValid(@wizard)
      @goToStep step: _.first(_.keys(@steps))
      return

    view = if step.view
      step.view
    else
      step.view = new step.klass(@wizard)

    $('#wizard').html view.render().el
    @updateNavigation()

  updateNavigation: ->
    for key, step of @steps
      if step.isValid(@wizard)
        step.$node.addClass('active')
      else
        step.$node.removeClass('active')

  render: ->
    @delegateEvents @events
    $(@el).html @template(steps: @steps)

    # привязка узлов навигации к @steps
    @.$('#navigation .step').each (index,node) =>
      $node = $(node)
      @steps[$node.data('key')].$node = $node
    @

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
        true
    agreement:
      index: 2
      name: 'Договор'
      $node: null
      klass: App.Views.Agreement
      isValid: (wizard) ->
        wizard.isAuthorized()
        true
    passports:
      index: 3
      name: 'Паспорта'
      $node: null
      klass: App.Views.Passports
      isValid: (wizard) ->
        wizard.isLicenseAccepted()
        true
    payment:
      index: 4
      name: 'Оплата'
      $node: null
      klass: App.Views.Payment
      isValid: (wizard) ->
        wizard.hasPassports()
        true
    tickets:
      index: 5
      name: 'Билеты'
      $node: null
      klass: App.Views.Tickets
      isValid: (wizard) ->
        wizard.isPaid()
        #true
