$(document).ready(function(){
  $('#post-job-btn').on('click',function(){
    $('.has-error').remove();
    $('#new_job')[0].reset();
  });
});
