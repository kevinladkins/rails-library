"use strict";

$(function() {
  $("#show-author-books").click(function(e) {
    let authorId = $(this).attr("data-author-id");
    $.get(`/authors/${authorId}/books.json`, books => {
      $("#author-books-list").html('')
      $("#author-books-list").html(unorderedList());
      let alphaBooks = alphabetize(books, "title")
      debugger
      alphaBooks.forEach(book => {
        let newBook = new Book(book);
        let html = newBook.listBook();
        $("#author-books-list ul").append(html);
      });
    });
  });
});
