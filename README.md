# Cycling Tristate Checkbox Vue.js Component

## Why this component?

Browsers do not support fully functional tristate checkboxes out of the box.  In particular:

- JavaScript is needed to activate indeterminate state.
- Clicking an indeterminate checkbox never gets you back to indeterminate state, there is no cycling through all three states out of the box.
- Form submission only sends `"on"` (or the value from `value=".."`) but never `"indeterminate"`.

This Vue component offers a fully functional cycling tristate checkbox.
It was written by [Sebastian Pipping](https://blog.hartwork.org/)
and is licensed under the [MIT license](https://opensource.org/licenses/MIT).
I'm happy about [bugs reports](https://github.com/hartwork/vue-tristate-checkbox/issues) for any issues you find.

If you like this component please support it with a star ★.  Thank you!


## Features

- An API that is very close to how you'd use regular binary checkboxes with Vue.js
- Support for form submission (using properties `name`, `value`, `value-indeterminate`)
- Cycles through all three states while clicking: off, on, intermediate, off, on,…
- Support for keyboard navigation using tabulator and spacebar
- Support for integration with `<label>`, either
  - bound using `for=".."` or
  - surrounding the component as a parent node
- Uses checkbox rendering native to the browser


## Design decisions

- Use native checkboxes as rendered by the browser for a look native to the current environment
- Be as close to `<input type="checkbox">` as possible, e.g. support attributes `checked`, `disabled`, `id`, `name`, `value` with the same naming
- Be as close to Vue's own take on checkboxes, e.g. support attributes `v-model`, `true-value`, `false-value` with the same naming
- Support a binary mode so the component _can_ take over all checkboxes in an app in a uniform way if desired
- (The component comes as a plain `.js` rather than a `.vue` file to keep things simple… but I'm open to arguments why a `.vue` file would greatly benefit this very case.)


# How to use

## With `v-model`

```html
<head>
  <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
  <script src="vue_cycling_tristate_checkbox_native.js"></script>
</head>

<body>
  <div id="app">
    <tristate-checkbox v-model="tribool_ref"></tristate-checkbox>
  </div>

  <script>
    var app = new Vue({
      el: '#app',
      data: {
        tribool_ref: null  // i.e. indeterminate state
      }
    })
  </script>
</body>
```

For a more elaborate version of this very example, please see
[`demo_with_vmodel.htm`](https://github.com/hartwork/vue-tristate-checkbox/blob/master/demo_with_vmodel.htm).


## Without `v-model`

```html
<head>
  <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
  <script src="vue_cycling_tristate_checkbox_native.js"></script>
</head>

<body>
  <div id="app">
    <tristate-checkbox ref="r1" indeterminate></tristate-checkbox>
  </div>

  <script>
    var app = new Vue({el: '#app'})
  </script>
</body>
```

Without `v-model` internal state storage is used.
In the example above, it can be accessed at `app.$refs.r1.state`.

For a more elaborate version of this very example, please see
[`demo_without_vmodel.htm`](https://github.com/hartwork/vue-tristate-checkbox/blob/master/demo_without_vmodel.htm).


# API

All properties documented below are **optional**.


## Model configuration

| Property | Type | Default value | Description |
|---|---|---:|---|
| `v-model` | `String` | n/a | External data property to use for storage of state |
| `true-value` | `String`/`Boolean` | `true` | Model value to use for checked state |
| `false-value` | `String`/`Boolean` | `false` | Model value to use for unchecked state |
| `null-value` | `String`/`Boolean` | `null` | Model value to use for indeterminate state |


## Form submission

| Property | Type | Default value | Description |
|---|---|---:|---|
| `name` | `String` | n/a | Name to use during form submission; set to enable form submission |
| `value` | `String` | `"on"` | Form submission value to use for checked state |
| `value-indeterminate` | `String` | `"indeterminate"` | Form submission value to use for indeterminate state |


## Behavior switches

These properties are mostly useful in absence of `v-model`.

| Property | Type | Default value | Description |
|---|---|---:|---|
| `binary` | `Boolean` | `false` | Whether to revert back to a binary checkbox, wins over indeterminate |
| `checked` | `Boolean` | `false` | Whether to start out checked |
| `disabled` | `Boolean` | `false` | Whether to start out disabled |
| `indeterminate` | `Boolean` | `false` | Whether to start out indeterminate, wins over checked |


## HTML anchor

Useful for URLs and binding a label with `for=".."`.

| Property | Type | Default value | Description |
|---|---|---:|---|
| `id` | `String` | n/a | HTML node ID to use for the checkbox `<input>` node of the component |


If you like this component please support it with a star ★.  Thank you!
