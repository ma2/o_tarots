# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  # FastClick.attach(document.body, false)
  # shakeしたときのハンドラ登録
  # Drawハンドラ登録
  $('.scrollable').pullToRefresh(
    callback: ->
      def = $.Deferred()
      setTimeout ->
        def.resolve()
      , 3000
      def.promise()
  )
  $('#draw').on('ajax:before', beforeDrawHandler)
  $('#draw').on('ajax:success', successDrawHandler)
  console.log('loaded')

# シャッフル用のハンドラ登録
$(document).on('shake', shuffleHandler)
$(document).trigger('shake')

# シャッフルハンドラ
shuffleHandler = ->
  $.ajax(
  ).done(doneSuffleHandler).fail(failureHandler)

# ドロー開始
beforeDrawHandler = ->
  console.log('beforeDraw')

# ドロー完了
successDrawHandler = ->
  console.log('successDraw')

# シャッフル開始
beforeSuffleHandler = ->
  console.log('beforeSuffle')

# シャッフル完了
doneSuffleHandler = ->
  console.log('doneSuffle')

# エラー
failureHandler = ->
  console.log('failureHandler')
