# Main Tool Bar package for Thera
The package depend on  tool-bar package.

![](Main%20Tool%20Bar%20package%20for%20Thera/f9006cda71c76269a3c53adb9ea02cbe.png)

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
