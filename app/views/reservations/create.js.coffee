<% if @reservation.errors.empty? %>
  $('.mensagemErro').hide()
  $('.mensagemSucesso').show()
  $('#new_reservation').reset()
<% else %>
  $('.mensagemErro').show()
  $('.mensagemSucesso').hide()
<% end %>