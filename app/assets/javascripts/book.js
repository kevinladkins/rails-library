"use strict";

$(function() {
  $("#most-borrowed-link").click(function(e) {
    e.preventDefault();
    fetch('/books/most_borrowed.json')
    .then(res => res.json())
    .then(books => {
      let $layout = $("#books-index").html(mostBorrowedLayout());
      books.forEach(book => {
        let newBook = new Book(book);
        let html = newBook.listBook();
        $("#books-index").append(html);
      })
    });
  });
});

$(function() {
  $("#fiction-link").click(function(e) {
    e.preventDefault();
    fetch('/books.json')
    .then(res => res.json())
    .then(books => {
      let $layout = $("#books-index").html(unorderedList());
      debugger
      books.forEach(book => {
        if (book.classification == "fiction") {
          let newBook = new Book(book);
          let html = newBook.listBook();
          $("#books-index").append(html);
        }
      })
    });
  });
});

$(function() {
  $("#non_fiction-link").click(function(e) {
    e.preventDefault();
    fetch('/books.json')
    .then(res => res.json())
    .then(books => {
      let $layout = $("#books-index").html(unorderedList());
      debugger
      books.forEach(book => {
        if (book.classification == "non_fiction") {
          let newBook = new Book(book);
          let html = newBook.listBook();
          $("#books-index").append(html);
        }
      })
    });
  });
});

function mostBorrowedLayout() {
  let html = `
  <ol></ol>
  `
  return html
}

function unorderedList() {
  let html = `<ul></ul>`
  return html
}

function Layout() {
  let html = `

  `
}

function Book(book) {
  this.id = book.id
  this.title = book.title
  this.synopsis = book.synopsis
  this.available_copies = book.available_copies
  this.publication_year = book.publication_year
  this.classification = book.classification
  this.copies = book.copies
  this.author = book.author
  this.categories = book.categories
}

Book.prototype.listBook = function() {
  let html = `
    <li><a href="/books/${this.id}">${this.title}</a> by <a href="/authors/${this.author.id}">${this.author.name}</a></li>
  `
  return html
}
