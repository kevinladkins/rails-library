"use strict";

$(function() {
  $("#most-borrowed-link").click(function(e) {
    debugger
    e.preventDefault();
    fetch('/books/most_borrowed.json')
    .then(res => res.json())
    .then(books => {
      var template = $('#most-borrowed-template').html();
        debugger
      var templateScript = Handlebars.compile(template);
      var result = templateScript(books);
      $("#books-index").html(result);
    });
  });
});

$(function() {
    $("h1").click(function() {
    $("h1").html("Seriously????");
  });
});

function Book(book) {
  this.id = book.id
  this.title = book.title
  this.synopsis = book.synopsis
  this.available_copies = book.available_copies
  this.publication_year = book.publication_year
  this.classifcation = book.classification
  this.copies = book.copies
  this.author = book.author
  this.categories = book.categories
}
