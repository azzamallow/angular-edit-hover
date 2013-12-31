'use strict'

describe 'Directive: editHover', ->

  beforeEach module 'editHover'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<edit-hover></edit-hover>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the editHover directive'
