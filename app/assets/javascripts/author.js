"use strict";

// PAGE SETUP & EVENT LISTENERS

var authorArray = []

$(function() {
  setAuthorListeners();
  getAuthors();
  $('#author-books-list').hide()
});

function setAuthorListeners() {
  $("#show-author-books").click(function(e) {
    $('#author-books-list').toggle();
  });
};



function getAuthors() {
  $.get('/authors.json', function(authors) {
    setAuthorsArray(authors);
  })
}

function setAuthorsArray(authors) {
  authors.forEach(function(author) {
    authorArray.push(author.name)
  });
  setAuthorSearch();
}



// AUTHOR MODEL

function Author(author) {
  this.id = author.id
  this.name = author.name
  this.books = alphabetize(author.books, "title")
}

Author.prototype.listBooks = function() {
  var html = ""
  var result = this.books.forEach(function(book) {
    html += '<li><a href="/books/' + book.id + '">' + book.title + '</a></li>'
  })
  return html
}

// SEARCH FUNCTIONS

function setAuthorSearch() {
  var authorNames = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.whitespace,
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    local: authorArray
  });

  $('#author-search .typeahead').typeahead({
      hint: true,
      highlight: true,
      minLength: 1
    },
    {
      name: 'authorNames',
      source: authorNames
  });
}
