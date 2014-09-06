// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


var BgApp = BgApp || {};

BgApp.addIdsToAddPlayerFormFields = function() {
  $(".add-player-fields").each(function(i){
    index = i + 1
    $(this).attr("id", "new-player-" + index);
  });
};

BgApp.revealAddPlayer = function() {
  var count = $(".visible-add-player").length + 1;
  $("#new-player-" + count).removeClass("hidden-add-player").addClass("visible-add-player");
};

BgApp.attachAddPlayerButtonClickHandler = function() {
  var apbutton = $("#add-player-button");
  apbutton.click(function(ev){
    ev.preventDefault();
    BgApp.revealAddPlayer();
    var recount = $(".visible-add-player").length
    if(recount === 10) {
      apbutton.hide();
    };
  });
};

BgApp.setup = function() {
  BgApp.addIdsToAddPlayerFormFields();
  BgApp.revealAddPlayer();
  BgApp.attachAddPlayerButtonClickHandler();
};

$(BgApp.setup);