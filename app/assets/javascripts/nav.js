$(function() {
  setActiveLink();
})

function setActiveLink() {
  var location = window.location.pathname.split("/")[1]
  if (!!$(`#${location}`)) {
    $(`#${location}`).addClass('active');
  }
}
