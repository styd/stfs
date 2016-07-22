function openTweet(screenName, id){
  var text = "";
  if (window.getSelection){
    text = window.getSelection().toString();
  } else if(document.selection && document.selection.type != "Control"){
    text = document.selection.createRange().text;
  }
  if (text.length == 0){
    window.open('https://twitter.com/'+screenName+'/status/'+id, '_blank');
  }
}

$(document).ready(function(){
  // for _header partial
  if(!$('#query').val().trim()) //empty or whitespace
    $('#submit').attr('disabled', true);

  $('#query').keyup(function(){
    if(!$('#query').val().trim()) //empty or whitespace
      $('#submit').prop('disabled', true);
    else
      $('#submit').prop('disabled', false);
  });

  // for search results
  $('#raw').toggle();

  $('#toggle').on('click', function(){
    if ($(this).html() == "RAW") {
      $(this).html("COOKED");
    } else {
      $(this).html("RAW");
    }
    $('#raw').toggle();
    $('#cooked').toggle();
  });

  $('.a-tweet a').on('click', function(e){
    e.stopPropagation();
  });
});
