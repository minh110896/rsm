$(document).on('click', '.show_jobs .pagination a', function (event) {
  event.preventDefault();
  $.getScript($(this).attr('href'));
  return false;
});

$(document).on('click', '.show_apply .pagination a', function (event) {
  event.preventDefault();
  $.getScript($(this).attr('href'));
  return false;
});
