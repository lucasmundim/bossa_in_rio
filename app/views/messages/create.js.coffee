  $('#new_message input').removeClass('erro')
  $('#new_message textarea').removeClass('erro')
<% if @message.errors.empty? %>
  $('.mensagemErro').hide()
  $('.mensagemSucesso').show()
  $('#new_message').reset()
<% else %>
  $('.mensagemErro').show()
  $('.mensagemSucesso').hide()
  <% @message.errors.keys.each do |field| %>
  $('#message_<%= field %>').addClass('erro')
  <% end %>
<% end %>