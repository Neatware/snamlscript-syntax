LanguageSnamlscriptView = require './language-snamlscript-view'
{CompositeDisposable} = require 'atom'

module.exports = LanguageSnamlscript =
  languageSnamlscriptView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @languageSnamlscriptView = new LanguageSnamlscriptView(state.languageSnamlscriptViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @languageSnamlscriptView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'language-snamlscript:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @languageSnamlscriptView.destroy()

  serialize: ->
    languageSnamlscriptViewState: @languageSnamlscriptView.serialize()

  toggle: ->
    console.log 'LanguageSnamlscript was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
