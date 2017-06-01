$(function() {
  $("#books-nav").click(function(e) {
    e.preventDefault();
    $("#view-content").html("")
  })
})

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
  this.author = book.author.name
  this.authorId = book.author.id
  this.categories = book.categories
}
