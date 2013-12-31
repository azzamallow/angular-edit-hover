(function() {
  'use strict';
  angular.module('editHover', []);

  angular.module('editHover').directive('editHover', function($document) {
    return {
      scope: {
        editHover: '='
      },
      link: function(scope, element, attrs) {
        var enabled, i, wrapper;
        enabled = false;
        scope.$watch('editHover', function() {
          return enabled = scope.editHover;
        });
        i = angular.element('<i class="fa fa-pencil"></i>');
        i.css({
          display: 'none',
          fontSize: '20px',
          right: '1px',
          pointerEvents: 'none',
          position: 'absolute',
          top: 0
        });
        wrapper = angular.element('<div class="edit-hover-wrapper"></div>');
        wrapper.css({
          width: '100%',
          height: '100%',
          border: '3px solid #ccc',
          marginTop: '-3px',
          marginLeft: '-3px',
          display: 'none',
          pointerEvents: 'none',
          position: 'absolute',
          top: 0,
          left: 0
        });
        element.addClass('edit-hover');
        element.css({
          position: 'relative'
        });
        element.append(i);
        element.append(wrapper);
        element.on('mouseover', function() {
          if (enabled === false) {
            return;
          }
          wrapper.css({
            display: 'block'
          });
          i.css({
            display: 'inline'
          });
          return element.css({
            opacity: 0.9
          });
        });
        element.on('mouseout', function() {
          wrapper.css({
            display: 'none'
          });
          i.css({
            display: 'none'
          });
          return element.css({
            opacity: 1
          });
        });
        return element.on('click', function() {
          wrapper.css({
            display: 'none'
          });
          i.css({
            display: 'none'
          });
          return element.css({
            opacity: 1
          });
        });
      }
    };
  });

}).call(this);
