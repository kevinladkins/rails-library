"use strict";

$(function() {
  setEventListeners();
  $("#add-category-form").hide();
})

function setEventListeners() {
  $("#next-category").click(function(e) {
    showNextCategory(e);
  });
  $("#create-category-button").click(function(e) {
    displayCategoryForm(e)
  });
}

function showNextCategory(e) {
  var $id = parseInt($(e.currentTarget).attr("data-category-id"));
  $.get(`/categories/${$id}/next`, resp => {
    var newCategory = new Category(resp);
    newCategory.showPage();
    history.pushState(null, null, `${newCategory.id}`)
  })
}

function displayCategoryForm(e) {
    e.preventDefault();
    $("#add-category-form").toggle();
    $("#add-category-form form").submit(function(e) {
      e.preventDefault();
      var values = $(this).serialize();
      var $book_id = $(this).attr("data-book-id")
      var posting = $.post(`/books/${$book_id}/categories.json`, values)
      posting.done(function(data) {
         let newCategory = new Category(data);
         let categoryText = newCategory.displayBookCategory();
         $("#book-categories-list").append(categoryText);
         $("#add-category-form").hide();
      })
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

Category.prototype.displayBookCategory = function() {
  let html = ` <a href="/categories/${this.id}">${this.name}</a> ||`
  return html
}
