"use strict";

// PAGE SETUP & EVENT LISTENERS

$(function() {
  setAuthorListeners();
});

function setAuthorListeners() {
  $("#show-author-books").click(function(e) {
    displayAuthorBooks(e);
  });
};


// AUTHOR MODEL

function Author(author) {
  this.id = author.id
  this.name = author.name
  this.books = alphabetize(author.books, "title")
}

Author.prototype.listBooks = function() {
  let html = ""
  let result = this.books.forEach(book => {
    html += `
      <li><a href="/books/${book.id}">${book.title}</a></li>
    `
  })
  return html
}


// AUTHOR#SHOW FUNCTIONS

function displayAuthorBooks(e) {
  let authorId = parseInt($(e.currentTarget).attr("data-author-id"));
  $.get(`/authors/${authorId}.json`, author => {
    let newAuthor = new Author(author)
    $("#author-books-list").html(unorderedList());
    let html = newAuthor.listBooks();
    $("#author-books-list ul").append(html);
    });
  };
