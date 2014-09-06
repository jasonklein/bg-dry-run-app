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

BgApp.revealFirstAddPlayer = function() {
  $("#new-player-1").removeClass("hidden-add-player");
}

BgApp.setup = function() {
  BgApp.addIdsToAddPlayerFormFields();
  BgApp.revealFirstAddPlayer();
}

$(BgApp.setup);