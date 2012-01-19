$ ->
  $(document).ready ->
    $("[data-toggle-hover]").parent().hover ->
      id = $('> a.menu', this).attr('data-rel')
      $("#" + id).slideToggle("fast")