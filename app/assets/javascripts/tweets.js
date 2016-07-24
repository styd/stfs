$(document).ready(function(){
  $('.a-tweet-or-status a').on('click', function(e){
    e.stopPropagation();
  });
});
