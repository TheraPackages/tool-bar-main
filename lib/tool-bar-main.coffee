module.exports =
  activate: (state) ->
    require('atom-package-deps').install('tool-bar-main')

  deactivate: ->
    @toolBar?.removeItems()

  serialize: ->

  consumeToolBar: (toolBar) ->
    @toolBar = toolBar 'main-tool-bar'

    @toolBar.addButton
      image:'./iconsets/logo.png'


    @toolBar.addButton
      icon: 'email-variant'
      callback: 'atom-live-server:start-3000'
      tooltip: 'Run localhost port 3000...'
      iconset: 'mdi'

    @toolBar.addSpacer()

    @toolBar.addButton
      icon: 'note-plus-outline'
      callback: 'create-files:toggle'
      tooltip: 'New file to project'
      iconset: 'mdi'

    @toolBar.addButton
      icon: 'folder-upload'
      callback: 'application:open-file'
      tooltip: 'Open weex file from local'
      iconset: 'mdi'

    @toolBar.addButton
      icon: 'content-save'
      callback: 'core:save'
      tooltip: 'Save weex file to local'
      iconset: 'mdi'

    @toolBar.addSpacer()

    @toolBar.addButton
      icon: 'play'
      callback: 'thera-live-server:start'
      tooltip: 'Run simulator'
      iconset: 'mdi'

    stop = @toolBar.addButton
      icon: 'stop'
      callback: 'thera-live-server:stop'
      iconset: 'mdi'
    stop.element.setAttribute('disabled', true)


    @toolBar.addButton
      icon: 'bug'
      callback: 'thera-live-server:debug'
      tooltip: 'Debug weex'
      iconset: 'mdi'

    @toolBar.addThera
      icon: 'play'
      id: 'thera-simulator-selector'
      menu:'runlist'
      callback: 'atom-live-server:start-3000'
      tooltip: 'Run localhost port 3000...'
      iconset: 'mdi'

    @toolBar.addButton
      icon: 'cellphone-link'
      callback: 'thera-live-server:qrcode'
      tooltip: 'Add new device to device-list'
      iconset: 'mdi'

    @toolBar.addSpacer()



    @toolBar.addButton
      icon: 'search'
      callback: 'find-and-replace:show'
      tooltip: 'Find in Buffer'
      iconset: 'ion'
    @toolBar.addButton
      icon: 'shuffle'
      callback: 'find-and-replace:show-replace'
      tooltip: 'Replace in Buffer'
      iconset: 'ion'

    @toolBar.addSpacer()

    @toolBar.addButton
      icon: 'trello'
      callback: 'symbols-tree-view:toggle'
      tooltip: 'Right view open&close'
      iconset: 'mdi'

    @toolBar.addButton
      icon: 'console'
      callback: 'console:toggle'
      tooltip: 'Console view open&close'
      iconset: 'mdi'

    @toolBar.addSpacer()

    @toolBar.addButton
      icon: 'barcode-scan'
      callback: 'thera-live-server:qrcode'
      tooltip: 'link device'
      iconset: 'mdi'

    if atom.inDevMode()
      @toolBar.addSpacer()

      @toolBar.addButton
        icon: 'refresh'
        callback: 'window:reload'
        tooltip: 'Reload Window'
        iconset: 'ion'
