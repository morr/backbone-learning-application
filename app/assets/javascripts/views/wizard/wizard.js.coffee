class App.Views.Wizard extends Backbone.View
  template: JST['wizard/wizard']
  steps: [
    { index: 1, name: 'Данные перелёта', $node: null, klass: App.Views.Flights },
    { index: 2, name: 'Авторизация', $node: null, klass: App.Views.Auth },
    { index: 3, name: 'Договор', $node: null, klass: App.Views.Agreement },
    { index: 4, name: 'Паспорта', $node: null, klass: App.Views.Passports },
    { index: 5, name: 'Оплата', $node: null, klass: App.Views.Payment },
    { index: 6, name: 'Билеты', $node: null, klass: App.Views.Tickets }
  ]

  initialize: (wizard) ->
    _.bindAll(@, 'updateNavigation')
    @wizard = wizard
    @wizard.on 'change', @updateNavigation

  showStep: (index) ->
    step = @steps[index]
    view = if step.view
      step.view
    else
      step.view = new step.klass(@wizard)

    $('#wizard').html view.render().el

  updateNavigation: ->
    for step in @steps
      step.$node.removeClass('active')

    @steps[0].$node.addClass('active')
    @steps[1].$node.addClass('active') if @wizard.hasFlights()
    @steps[2].$node.addClass('active') if @wizard.isAuthorized()
    @steps[3].$node.addClass('active') if @wizard.isLicenseAccepted()
    @steps[4].$node.addClass('active') if @wizard.hasPassports()
    @steps[5].$node.addClass('active') if @wizard.isPaid()

  render: ->
    $(@el).html @template(steps: @steps)

    # засовываем узлы навигации в @steps
    $steps = @.$('#navigation .step')
    #for step, index of @steps
    _.each @steps, (step, index) ->
      step.$node = $($steps[index])

    @updateNavigation()
    @
