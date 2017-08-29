"use strict";

$(function() {
  $('#overdue-loans-table').hide();
  setEventListeners();
})

function setEventListeners() {
  $('#toggle-overdue').click(function() {
    showOverdueLoans();
  });
  $('#toggle-all-loans').click(function() {
    showAllLoans();
  })
  $('.loan-row').click(function(e) {
    var row = e.target.parentElement;
    var id = $(row).data('user-id');
    window.location.href = 'users/' + id;
  })
}

function showOverdueLoans() {
  $('#loans-panel').addClass('panel-danger');
  $('#loans-panel').removeClass('panel-info');
  $('#toggle-overdue').addClass('active');
  $('#toggle-all-loans').removeClass('active');
  $('#all-loans-table').hide();
  $('#overdue-loans-table').show();
}

function showAllLoans() {
  $('#loans-panel').removeClass('panel-danger');
  $('#loans-panel').addClass('panel-info');
  $('#toggle-overdue').removeClass('active');
  $('#toggle-all-loans').addClass('active');
  $('#all-loans-table').show();
  $('#overdue-loans-table').hide();
}
