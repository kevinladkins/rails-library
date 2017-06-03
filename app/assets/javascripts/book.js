


$(function() {
  $("#most-borrowed-link").click(function(e) {
    e.preventDefault();
    fetch('/books/most_borrowed.json')
    .then(res => res.json())
    .then(books => {
      $("#books-index").html(orderedList());
      books.forEach(book => {
        let newBook = new Book(book);
        let html = newBook.listBook();
        $("#books-index ol").append(html);
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
      booksList(books, "fiction");
    });
  });
});

$(function() {
  $("#non_fiction-link").click(function(e) {
    e.preventDefault();
    fetch('/books.json')
    .then(res => res.json())
    .then(books => {
       booksList(books, "non_fiction")
    });
  });
});

function booksList(books, classification) {
  $("#books-index").html('')
  $("#books-index").html(unorderedList());
  let alphaBooks = alphabetize(books, "title")
  alphaBooks.forEach(book => {
    if (book.classification == classification) {
      let newBook = new Book(book);
      let html = newBook.listBook();
      $("#books-index ul").append(html);
    }
  })
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
