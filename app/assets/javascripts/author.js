"use strict";

$(function() {
  $("#show-author-books").click(function(e) {
    let authorId = $(this).attr("data-author-id");
    $.get(`/authors/${authorId}.json`, author => {
      let newAuthor = new Author(author)
      $("#author-books-list").html('')
      $("#author-books-list").html(unorderedList());
      let html = newAuthor.listBooks();
      $("#author-books-list ul").append(html);
      });
    });
  });

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
  debugger
  return html
}
