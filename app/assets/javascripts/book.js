"use strict";

// PAGE SETUP & EVENT LISTENERS

var booksArray = []
var titleArray = []

$(function() {
  setBookListeners();
  $("#new-author-field-set").hide()
  $("#select-categories-field-set").hide()
  getBooks();
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
  $("#all-books-link").click(function() {
     displayAll()
  });
  $("#add-new-author-button").click(function(e) {
     displayAuthorFieldSet(e);
  });
  $("#select-categories-button").click(function(e) {
     displayCategoryFieldSet(e);
  });
};


//BOOK MODEL

function Book(book) {
  this.id = book.id
  this.title = book.title
  this.alpha_title = book.alpha_title
  this.synopsis = book.synopsis
  this.available_copies = book.available_copies
  this.publication_year = book.publication_year
  this.classification = book.classification
  this.copies = book.copies
  this.author = book.author
  this.categories = book.categories
}


Book.prototype.bookTableData = function() {
  let html = `
    <tr>
      <td><a href="/books/${this.id}">${this.alpha_title}</a></td>
      <td><a href="/authors/${this.author.id}">${this.author.name}</a></td>
    </tr>
  `
  return html
}

Book.prototype.numberedTableData = function(rank) {
  let html = `
    <tr>
      <td><a href="/books/${this.id}">${rank}.  ${this.alpha_title}</a></td>
      <td><a href="/authors/${this.author.id}">${this.author.name}</a></td>
    </tr>
  `
  return html
}


// BOOKS#INDEX FUNCTIONS

function getBooks() {
  $.get('/books.json', books => {
      booksArray = books;
      setTitleArray(books);
      setBookSearch();
      displayCategory("all");
  })
}

function setTitleArray(books) {
  books.forEach(book => {
    titleArray.push(book.title);
  })
}

function displayAll() {
    booksList(booksArray, "all")
}

function displayCategory(category) {
     booksList(booksArray, category)
};

function displayMostBorrowed() {
  $.get('/books/most_borrowed.json', books => {
    mostBorrowedList(books)
  });
};


function booksList(books, classification) {
  $("#books-index").html(bookTable());
  let alphaBooks = alphabetize(books, "alpha_title")
  alphaBooks.forEach(book => {
    if (book.classification == classification || classification == "all") {
      let newBook = new Book(book);
      let html = newBook.bookTableData();
      $("#books-index table tbody").append(html);
    }
  })
};

function mostBorrowedList(books) {
  $("#books-index").html(bookTable());
  books.forEach((book, index) => {
    let newBook = new Book(book);
    let rank = index +1
    let html = newBook.numberedTableData(rank);
    $("#books-index table tbody").append(html);
  });
};

//BOOK SEARCH FUNCTIONS

function setBookSearch() {
  var titles = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.whitespace,
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    local: titleArray
  });

  $('#book-search .typeahead').typeahead({
      hint: true,
      highlight: true,
      minLength: 1
    },
    {
      name: 'titles',
      source: titles
    });
}


//BOOKS#NEW FUNCTIONS

function displayAuthorFieldSet(e) {
  e.preventDefault();
  $("#new-author-field-set").toggle()
};

function displayCategoryFieldSet(e) {
  e.preventDefault();
  $("#select-categories-field-set").toggle()
};
