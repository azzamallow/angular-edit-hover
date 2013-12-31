angular-edit-hover
==================

An AngularJS directive which adds borders and edit icon upon hover of an element

install
-------

```
bower install angular-edit-hover
```

usage
-----

Make sure you include the module in your application config

```
angular.module('myApp', [
  'editHover',
  ...
]);
```

Now add to any element

```
<div edit-hover="true"></div>
```

Pass in false to disable the directive

```
<div edit-hover="false"></div> <!-- disabled -->
```
