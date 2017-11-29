$(document).on('click', '#cancel_achievement_edit', function(){
  var achievement_id = $('#cancel_achievement_edit').val();
  $('#edit_achievement_'+achievement_id).remove();
  $('#info_achievement_'+achievement_id).show();
});
$(document).on('click', '#cancel_achievement_new', function(){
  $('#new_achievement').remove();
  $('#btn-add-achievements').show();
});
$(document).on('click', '#cancel_user_edit', function(){
  var user_id = $('#cancel_user_edit').val();
  $('#edit_user_'+user_id).remove();
  $('#show-user').show(1000);
});
>>>>>>> create-delete-certificate
$(document).on('click', '#cancel_club_new', function(){
  $('#new_club').remove();
  $('#btn-add-club').show();
});
$(document).on('click', '#cancel_club_edit', function(){
  var club_id = $('#cancel_club_edit').val();
  $('#edit_club_' + club_id).remove();
  $('#info_club_' + club_id).show();
});
$(document).on('click', '#club_current',function(){
  if($('#club_end_time').attr('disabled')) {
    $('#club_end_time').removeAttr('disabled');
  }
  else {
    $('#club_end_time').attr({disabled:'disabled'});
  }
});
$(document).on('turbolinks:load', function() {
  $('.datepick').datepicker( {
    format: 'dd-mm-yyyy',
    startView: 'months'
  });
});
$(document).on('click', '#cancel_certificate_new', function(){
  $('#new_certificate').remove();
  $('#btn-add-certificate').show();
});
$(document).on('click', '#cancel_certificate_edit', function(){
  var certificate_id = $('#cancel_certificate_edit').val();
  $('#edit_certificate_' + certificate_id).remove();
  $('#info_certificate_' + certificate_id).show();
});

