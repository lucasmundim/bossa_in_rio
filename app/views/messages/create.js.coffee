<% if @message.errors.empty? %>
  $('.mensagemErro').hide()
  $('.mensagemSucesso').show()
  $('#new_message').reset()
<% else %>
  $('.mensagemErro').show()
  $('.mensagemSucesso').hide()
<% end %>