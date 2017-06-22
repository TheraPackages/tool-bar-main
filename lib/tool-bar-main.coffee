childProcess = require 'child_process'
commandGetSsid = '/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk \'/ SSID/ {print substr($0, index($0, $2))}\''
commandGetAliLangProfile = 'profiles -L'

module.exports =
  activate: (state) ->
    require('atom-package-deps').install('tool-bar-main')

  deactivate: ->
    @toolBar?.removeItems()

  serialize: ->

  isAliNetwork:()->
    return false if process.platform == "win32"
    ssidRet = childProcess.execSync commandGetSsid
    ssid = new TextDecoder("utf-8").decode(ssidRet).replace(/[\r\n]/g,"")
    ssid == 'alibaba-inc'

  hasAliLangProfile:()->
    return false if process.platform == "win32"
    profiles = childProcess.execSync commandGetAliLangProfile
    aliLangRe = /com.alibaba.mdm.profile/;
    aliLangRe.test(profiles)

  consumeToolBar: (toolBar) ->
    @toolBar = toolBar 'main-tool-bar'

    @toolBar.addButton
      image:'./iconsets/logo.png'


    @toolBar.addButton
      icon: 'email'
      callback: 'atom-live-server:start-3000'
      tooltip: 'Run localhost port 3000...'
      iconset: 'mdi'

    @toolBar.addSpacer()

    @toolBar.addButton
      icon: 'note-plus-outline'
      callback: 'create-files:toggle'
      tooltip: 'New weex file'
      iconset: 'mdi'

    @toolBar.addButton
      icon: 'folder-upload'
      callback: 'application:open-folder'
      tooltip: 'Open weex file from local'
      iconset: 'mdi'

    @toolBar.addButton
      icon: 'content-save'
      callback: 'core:save'
      tooltip: 'Save weex file to local'
      iconset: 'mdi'

    @toolBar.addSpacer()

    @toolBar.addButton
      icon: 'queue_play_next'
      callback: 'thera-device-panel:show'
      tooltip: 'Add devices to run'
      iconset: 'material-icons'
      id:'add-device-to-run-button'

    @toolBar.addThera
      id: 'thera-simulator-selector'
      menu:'runlist'
      callback: 'atom-live-server:start-3000'
      tooltip: 'Run localhost port 3000...'

    @toolBar.addRefreshButton
      icon: 'refresh'
      tooltip: 'Refresh page of all connected devices'

    @toolBar.addButton
      icon: 'bug'
      callback: 'thera-live-server:debug'
      tooltip: 'Debug weex'
      iconset: 'mdi'


    @toolBar.addSpacer()



    @toolBar.addButton
      icon: 'search'
      callback: 'project-find:show'
      tooltip: 'Find in Buffer'
      iconset: 'ion'


    @toolBar.addSpacer()

    @toolBar.addButton
      icon: 'page-layout-sidebar-left'
      callback: 'tree-view:toggle'
      tooltip: 'Left view open&close'
      iconset: 'mdi'

    @toolBar.addButton
      icon: 'page-layout-sidebar-right'
      callback: 'symbols-tree-view:toggle'
      tooltip: 'Right view open&close'
      iconset: 'mdi'

    @toolBar.addButton
      icon: 'page-layout-footer'
      callback: 'console:toggle'
      tooltip: 'Console view open&close'
      iconset: 'mdi'

    @toolBar.addSpacer()

    if @isAliNetwork() || @hasAliLangProfile()
      @toolBar.addButton
        icon: 'cloud_upload'
        id:'deploy_js_file_button'
        tooltip: 'Deploy code to oreo server'
        iconset: 'material-icons'

    if @isAliNetwork() || @hasAliLangProfile()
      @toolBar.addButton
        icon: 'upload'
        id:'deploy_mock_file_button'
        tooltip: 'Deploy mock data to server'
        iconset: 'mdi'

#    @toolBar.addButton
#      icon: 'presentation-play'
#      callback: ''
#      tooltip: 'preview'
#      iconset: 'mdi'

    if atom.inDevMode()
      @toolBar.addSpacer()

      @toolBar.addButton
        icon: 'refresh'
        callback: 'window:reload'
        tooltip: 'Reload Window'
        iconset: 'ion'