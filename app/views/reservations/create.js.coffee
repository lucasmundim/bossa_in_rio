<% if @reservation.errors.empty? %>
  $('.mensagemErro').hide()
  $('.mensagemSucesso').show()
  $('#new_reservation').reset()
  $('#contact_details').hide()
  $('#contact_details_toggle').show()
  $('#transfer_details').hide()
<% else %>
  $('.mensagemErro').show()
  $('.mensagemSucesso').hide()
<% end %>