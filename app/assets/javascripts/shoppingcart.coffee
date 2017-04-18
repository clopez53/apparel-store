# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
document.addEventListener 'turbolinks:load', ->
  $('input[type=number]').change ->
    id = 'edit_' + @id
    $('form[id=' + id + ']').submit()
    return
  return

# These turbolinks lets the user
# add or remove items to the shoppingcart cart items
# Javascript helps the Shopping Cart refresh
# automatically when adjusting the quantity
# of items during an order
# for subtotal, GST, PST, or HST and Total
