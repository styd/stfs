// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets

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

// for _header partial
function disableFind(){
    if(!$('#query').val().trim()) { //empty or whitespace
      $('#submit').prop('disabled', true);
    } else {
      if ($('#log-in').length){
        $('#submit').prop('disabled', true);
      } else {
        $('#submit').prop('disabled', false);
      }
    }
}

$(document).ready(function(){
  disableFind();
  $('#query').on('keyup', function(){
    disableFind();
  });

  // for search results
  $('#toggle').on('click', function(){
    if ($(this).html() == "RAW") {
      $(this).html("COOKED");
    } else {
      $(this).html("RAW");
    }
    $('#raw').toggle();
    $('#cooked').toggle();
  });
});
