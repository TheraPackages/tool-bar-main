# Main Tool Bar package for Thera
The package depend on  tool-bar package.

![](https://gw.alicdn.com/tps/TB1jhBnPVXXXXXjapXXXXXXXXXX-1384-61.jpg)

You can add buttons to toolbar:
* Menu:event handler for each menu option.
* Button:a basic button.
* State button:on state-feedback button

## Examples
Add basic button
```
@toolBar.addButton
      icon: 'email-variant'
      callback: 'atom-live-server:start-3000'
      tooltip: 'Run localhost port 3000...'
      iconset: 'mdi'
```

Add menu
```
//todo
```

Add state button
```
stop = @toolBar.addButton
      icon: 'stop'
      callback: 'thera-live-server:stop'
      iconset: 'mdi'
stop.element.setAttribute('disabled', true)
```

## Documentation
Todo list

## License
[MTL](https://github.com/TheraPackages/tool-bar-main/blob/master/LICENSE.md)
