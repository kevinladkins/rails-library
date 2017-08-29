"use strict";

// PAGE SETUP & EVENT LISTENERS

$(function() {
  setCategoryListeners();
  $("#add-category-form").hide();
  setCategoryFormListener()
});

function setCategoryListeners() {
  $("#next-category").click(function(e) {
    showNextCategory(e);
  });

  $("#create-category-button").click(function(e) {
    showCategoryForm(e);
  });
};

function setCategoryFormListener() {
  $("#add-category-form form").submit(function(e) {
    e.preventDefault();
    var values = $(this).serialize();
    var bookId = $(this).attr("data-book-id");
    createCategory(bookId, values);
  });
}

//CATEGORY MODEL

function Category(category) {
  this.name = category.name
  this.books = category.books
  this.id = category.id
}

Category.prototype.showPage = function() {
  $("#category-name").html(this.name);
  $("#category-book-list").html("");
  var listBook = this.listBook;
  this.books.forEach(function(book) {
    var listItem = listBook(book)
    $("#category-book-list").append(listItem);
  });
  $("#next-category").attr("data-category-id", this.id);
}

Category.prototype.listBook = function(book) {
  var html = ' <tr> \
      <td><a href="/books/' + book.id + '">' + book.title + '</a></td> \
      <td><a href="/authors/' + book.author.id + '">' + book.author + '</a></td> \
    </tr>'
  return html
}

Category.prototype.displayBookCategory = function() {
  var html = '<a href="/categories/' + this.id + '">' + this.name + '</a> ||'
  return html
}


// CATEGORIES#SHOW "NEXT"

function showNextCategory(e) {
  var $id = parseInt($(e.currentTarget).attr("data-category-id"));
  $.get('/categories/' + $id + '/next', function(category) {
    var newCategory = new Category(category);
    newCategory.showPage();
    history.pushState(null, null, newCategory.id);
  });
};


// CREATE CATEGORY VIA BOOKS#SHOW

function showCategoryForm(e) {
  e.preventDefault();
  $("#add-category-form").toggle();
};

function createCategory(bookId, values) {
  var posting = $.post('/books/' + bookId + '/categories.json', values);
  posting.done(function(category) {
    showNewCategory(category)
    $("#new-category-field").val('')
  });
}

function showNewCategory(category) {
  var newCategory = new Category(category);
  var categoryText = newCategory.displayBookCategory();
  $("#book-categories-list").append(categoryText);
  $("#add-category-form").hide();
}
