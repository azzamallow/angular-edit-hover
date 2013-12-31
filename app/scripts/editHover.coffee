'use strict'

angular.module 'editHover', []

angular.module('editHover')
  .directive 'editHover', ($document) ->
    scope:
      editHover: '='
    link: (scope, element, attrs) ->
      enabled = false

      scope.$watch 'editHover', ->
        enabled = scope.editHover

      # Edit icon
      i = angular.element '<i class="fa fa-pencil"></i>'

      # Edit icon styles
      i.css
        display:       'none'
        fontSize:      '20px'
        right:         '1px'
        pointerEvents: 'none'
        position:      'absolute'
        top:           0

      # Hover border
      wrapper = angular.element '<div class="edit-hover-wrapper"></div>'

      # Hover border styles
      wrapper.css
        width:         '100%'
        height:        '100%'
        border:        '3px solid #ccc'
        marginTop:     '-3px'
        marginLeft:    '-3px'
        display:       'none'
        pointerEvents: 'none'
        position:      'absolute'
        top:           0
        left:          0

      # Element
      element.addClass 'edit-hover'

      # Element styles
      element.css position: 'relative'

      # Append elements
      element.append i
      element.append wrapper

      # Element events
      element.on 'mouseover', ->
        return if enabled == false
        
        # return if $($document[0].activeElement).closest(element).length > 0

        wrapper.css display: 'block'
        i.css       display: 'inline'
        element.css opacity: 0.9
        
      element.on 'mouseout', ->
        wrapper.css display: 'none'
        i.css       display: 'none'
        element.css opacity: 1

      element.on 'click', ->
        wrapper.css display: 'none'
        i.css       display: 'none'
        element.css opacity: 1