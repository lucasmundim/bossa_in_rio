  $('#new_reservation input').removeClass('erro')
  $('#new_reservation textarea').removeClass('erro')
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
  <% @reservation.errors.keys.each do |field| %>
  $('#reservation_<%= field %>').addClass('erro')
  <% end %>
<% end %>