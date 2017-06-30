"use strict";

// PAGE SETUP & EVENT LISTENERS

$(function() {
  setBookListeners();
  $("#new-author-field-set").hide()
  $("#select-categories-field-set").hide()
});

function setBookListeners() {
  $("#fiction-link").click(function() {
    displayCategory("fiction");
  });
  $("#non-fiction-link").click(function() {
    displayCategory("non_fiction")
  });
  $("#most-borrowed-link").click(function() {
     displayMostBorrowed()
  });
  $("#add-new-author-button").click(function() {
     displayAuthorFieldSet();
  });
  $("#select-categories-button").click(function() {
     displayCategoryFieldSet();
  });
};


//BOOK MODEL

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


// BOOKS#INDEX FUNCTIONS

function displayCategory(category) {
  $.get('/books.json', books => {
     booksList(books, category)
  });
};

function displayMostBorrowed() {
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

//BOOKS#NEW FUNCTIONS

function displayAuthorFieldSet() {
  $("#new-author-field-set").toggle()
};

function displayCategoryFieldSet(e) {
  $("#select-categories-field-set").toggle()
};
