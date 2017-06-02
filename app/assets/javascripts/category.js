"use strict";

$(function() {
  $("#next-category").click(function(e) {
    showNextCategory(e);
  })
})

function showNextCategory(e) {
  var $id = parseInt($(e.currentTarget).attr("data-category-id")) + 1;
  $.get(`/categories/${$id}.json`, resp => {
    var newCategory = new Category(resp);
    newCategory.showPage();
    history.pushState(null, null, `${$id}`)
  })
}

function Category(category) {
  this.name = category.name
  this.books = category.books
  this.id = category.id
}

Category.prototype.showPage = function() {
  $("#category-name").html(this.name);
  $("#category-book-list").html("");
  this.books.forEach(book => {
    let listItem = this.listBook(book)
    $("#category-book-list").append(listItem);
  });
  $("#next-category").attr("data-category-id", this.id);
}

Category.prototype.listBook = function(book) {
  let html = `
    <li><a href="/books/${book.id}">${book.title}</a> by <a href="/authors/${book.author.id}">${book.author}</a></li>
  `
  return html
}
