"use strict";

$(function() {
  $("#most-borrowed-link").click(function(e) {
    e.preventDefault();
    fetch('/books/most_borrowed.json')
    .then(res => res.json())
    .then(books => {
      var template = $('#most-borrowed-template').html();
      var templateScript = Handlebars.compile(template);
      var result = templateScript(books);
      $("#books-index").html(result);
    });
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
