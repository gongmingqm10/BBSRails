#= require jquery.js

(($) ->
  $.fn.loginForm = ->
    form = $(this)

    $('.cancel', form).on 'click', ->
      form[0].reset()
      $('.has-error').empty()
      event.preventDefault()
)(jQuery)

jQuery ->
  $('#login-form').loginForm()