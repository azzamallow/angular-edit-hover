'use strict'

angular.module 'editHover', []

angular.module('editHover')
  .directive 'editHover', ->
    template: '<div></div>'
    restrict: 'E'
    link: (scope, element, attrs) ->
      element.text 'this is the editHover directive'