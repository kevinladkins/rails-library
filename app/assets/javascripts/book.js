$(function() {
  $("#books-nav").click(function(e) {
    e.preventDefault();
    fetch('/books.json')
    .then(res => res.json())
    .then(books => {
      $("#view-content").html(" ");
      books.forEach(book => {
        let bookObj = new Book(book)
        let bookHTML = `<h1>${bookObj.title}</h1>`;
        $("#view-content").append(bookHTML);
      });
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
