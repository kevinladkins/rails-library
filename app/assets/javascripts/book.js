"use strict";

// PAGE SETUP & EVENT LISTENERS

$(function() {
  setBookListeners();
  $("#new-author-field-set").hide()
  $("#select-categories-field-set").hide()
});

function setBookListeners() {
  $("#fiction-link").click(function(e) {
    displayCategory(e, "fiction");
  });
  $("#non-fiction-link").click(function(e) {
    displayCategory(e, "non_fiction")
  });
  $("#most-borrowed-link").click(function(e) {
     displayMostBorrowed(e)
  });
};

// BOOKS#INDEX

function displayCategory(e, category) {
  e.preventDefault();
  $.get('/books.json', books => {
     booksList(books, category)
  });
};

function displayMostBorrowed(e) {
  e.preventDefault();
  $.get('/books/most_borrowed.json', books => {
    mostBorrowedList(books)
  });
};


function booksList(books, classification) {
  $("#books-index").html(unorderedList());
  let alphaBooks = alphabetize(books, "title")
  alphaBooks.forEach(book => {
    if (book.classification == classification) {
      let newBook = new Book(book);
      let html = newBook.listBook();
      $("#books-index ul").append(html);
    }
  })
};

function mostBorrowedList(books) {
  $("#books-index").html(orderedList());
  books.forEach(book => {
    let newBook = new Book(book);
    let html = newBook.listBook();
    $("#books-index ol").append(html);
  });
};

//


$(function(){
  $("#add-new-author-button").click(function(e) {
    e.preventDefault(e)
    $("#new-author-field-set").toggle()
  })
})

$(function(){
  $("#select-categories-button").click(function(e) {
    e.preventDefault(e)
    $("#select-categories-field-set").toggle()
  })
})


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
