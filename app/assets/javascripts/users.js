"use strict";

var userArray = []

$(function() {
  getUsers()
})

function getUsers() {
  $.get('/users.json', users => {
    setUsersArray(users)
  })
}

function setUsersArray(users) {
  users.forEach(user => {
    userArray.push(user.name)
  })
  setUsersSearch();
}


function setUsersSearch() {
  var users = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.whitespace,
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    local: userArray
  });

  $('#user-search .typeahead').typeahead({
      hint: true,
      highlight: true,
      minLength: 1
    },
    {
      name: 'users',
      source: users
    });
}
