# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

simplifyResponseHandler = (data) ->
    paymentForm = $('#simplify-payment-form')
    $('.error').remove()
    if data.error
        if data.error.code == 'validation'
            errorList = ''
            for f in data.error.fieldErrors
                errorList += "<div class='error'>Field #{f.field} is invalid &ndash; #{f.message}</div>"
            paymentForm.after errorList

        $('#process-payment-btn').removeAttr 'disabled'
    else
        token = data['id']
        paymentForm.append "<input type='hidden' name='simplifyToken' value='#{token}'>"
        paymentForm.get(0).submit()
    return

ready = ->
    $('#simplify-payment-form').on 'submit', ->
        $('#process-payment-btn').attr disabled: 'disabled'
        alert("DEVELOPER: Remove this alert and fill in your simplify public key into app/assets/javascripts.payment.js.coffee")
        SimplifyCommerce.generateToken {
            key: 'YOUR-PUBLIC-KEY',
            card: {
                number: $('#cc-number').val(),
                cvc: $('#cc-cvc').val(),
                expMonth: $('#cc-exp-month').val(),
                expYear: $('#cc-exp-year').val().slice(-2)
            }
        }, simplifyResponseHandler
        false

$(document).ready(ready)
