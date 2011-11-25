$ ->
  $(document).ready ->
    $("[data-toggle-hover]").parent().hover ->
      id = $('> a.menu', this).attr('rel')
      $("#" + id).slideToggle("fast")