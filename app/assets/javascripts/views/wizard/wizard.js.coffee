class App.Views.Wizard extends Backbone.View
  template: JST['wizard/wizard']
  steps: [
    { index: 1, name: 'Данные перелёта', $node: null },
    { index: 2, name: 'Авторизация', $node: null },
    { index: 3, name: 'Договор', $node: null },
    { index: 4, name: 'Паспорта', $node: null },
    { index: 5, name: 'Оплата', $node: null },
    { index: 6, name: 'Билеты', $node: null }
  ]

  initialize: (wizard) ->
    _.bindAll(@, 'updateNavigation')
    @wizard = wizard
    @wizard.on 'change', @updateNavigation

  #events:
    #'step:select': 'step'

  #step: (e, index) ->
    #el = @.$('#navigation .step')[index]
    #$(el).addClass('active')

  updateNavigation: ->
    _.each @steps, (step) ->
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
    _.each @steps, (step, index) ->
      step.$node = $($steps[index])

    @updateNavigation()
    @
