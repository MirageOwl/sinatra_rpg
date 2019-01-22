var variable = function () { window.location.replace("/form"); };
var openMenu = function (crafter) {
  $("."+crafter).toggle();
};
var craft = function (crafter) {
  $.post("/crafters", {'crafter': crafter},
  function (data) {
    if(data) alert("Success");
    else alert("Not enough resources");
    window.location.replace("/crafters"); });
};
var collect = function (item) {
  $.post("/collect", {'item': item},
  function (data) {
    window.location.replace("/collect"); });
};
