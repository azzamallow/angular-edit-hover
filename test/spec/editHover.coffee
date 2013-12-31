'use strict'

describe 'Directive: editHover', ->

  beforeEach module 'editHover'

  scope   = {}
  element = null

  beforeEach inject ($rootScope, $compile) ->
    scope   = $rootScope.$new()
    element = angular.element '<div edit-hover="isEnabled"></div>'
    element = $compile(element) scope
    scope.isEnabled = true
    scope.$digest()

  it 'should add css class', ->
    expect(element.hasClass('edit-hover')).toEqual true

  it 'should have an relative position', ->
    expect(element.css('position')).toEqual 'relative'

  describe 'icon', ->
    icon = null

    beforeEach ->
      icon = element.find 'i'

    it 'should be appended to the element', ->
      expect(icon.length).toEqual 1

    it 'should have font awesome classes', ->
      expect(icon.hasClass('fa')).toEqual true
      expect(icon.hasClass('fa-pencil')).toEqual true

    it 'should have styles', ->
      expect(icon.css('display')).toEqual 'none'
      expect(icon.css('fontSize')).toEqual '20px'
      expect(icon.css('right')).toEqual '1px'
      expect(icon.css('pointerEvents')).toEqual 'none'
      expect(icon.css('position')).toEqual 'absolute'
      expect(icon.css('top')).toEqual '0px'

  describe 'wrapper', ->
    wrapper = null

    beforeEach ->
      wrapper = angular.element element[0].querySelector('.edit-hover-wrapper')

    it 'should be appended to the element', ->
      expect(wrapper.length).toEqual 1

    it 'should have styles', ->
      expect(wrapper.css('width')).toEqual '100%'
      expect(wrapper.css('height')).toEqual '100%'
      expect(wrapper.css('border')).toEqual '3px solid rgb(204, 204, 204)'
      expect(wrapper.css('marginTop')).toEqual '-3px'
      expect(wrapper.css('marginLeft')).toEqual '-3px'
      expect(wrapper.css('display')).toEqual 'none'
      expect(wrapper.css('pointerEvents')).toEqual 'none'
      expect(wrapper.css('position')).toEqual 'absolute'
      expect(wrapper.css('top')).toEqual '0px'
      expect(wrapper.css('left')).toEqual '0px'

  describe 'when click happens', ->
    icon    = null
    wrapper = null

    beforeEach ->
      icon    = element.find 'i'
      wrapper = angular.element element[0].querySelector('.edit-hover-wrapper')

      wrapper.css 'display', 'block'
      icon.css    'display', 'block'
      
      element.triggerHandler 'click'

    it 'should hide the wrapper', ->
      expect(wrapper.css('display')).toEqual 'none'

    it 'should hide the icon', ->
      expect(icon.css('display')).toEqual 'none'

    it 'should set the opacity of the element', ->
      expect(element.css('opacity')).toEqual '1'      

  describe 'when mouseout happens', ->
    icon    = null
    wrapper = null

    beforeEach ->
      icon    = element.find 'i'
      wrapper = angular.element element[0].querySelector('.edit-hover-wrapper')

      wrapper.css 'display', 'block'
      icon.css    'display', 'block'
      
      element.triggerHandler 'mouseout'

    it 'should hide the wrapper', ->
      expect(wrapper.css('display')).toEqual 'none'

    it 'should hide the icon', ->
      expect(icon.css('display')).toEqual 'none'

    it 'should set the opacity of the element', ->
      expect(element.css('opacity')).toEqual '1'  

  describe 'when mouseover happens', ->
    icon    = null
    wrapper = null

    beforeEach ->
      icon    = element.find 'i'
      wrapper = angular.element element[0].querySelector('.edit-hover-wrapper')

      wrapper.css 'display', 'none'
      icon.css    'display', 'none'
      
      element.triggerHandler 'mouseover'

    it 'should show the wrapper', ->
      expect(wrapper.css('display')).toEqual 'block'

    it 'should show the icon', ->
      expect(icon.css('display')).toEqual 'inline'

    it 'should set the opacity of the element', ->
      expect(element.css('opacity')).toEqual '0.9'  

    describe 'if the edit hover is disabled', ->
      beforeEach ->
        wrapper.css 'display', 'none'
        icon.css    'display', 'none'
        element.css 'opacity', '0.1'

        scope.isEnabled = false
        scope.$digest()

        element.triggerHandler 'mouseover'

      it 'should not do anything', ->
        expect(wrapper.css('display')).not.toEqual 'block'
        expect(icon.css('display')).not.toEqual 'inline'
        expect(element.css('opacity')).not.toEqual '0.9'  
