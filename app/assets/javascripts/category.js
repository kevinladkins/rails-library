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
    let values = $(this).serialize();
    let bookId = $(this).attr("data-book-id");
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
  this.books.forEach(book => {
    let listItem = this.listBook(book)
    $("#category-book-list").append(listItem);
  });
  $("#next-category").attr("data-category-id", this.id);
}

Category.prototype.listBook = function(book) {
  let html = `
    <tr>
      <td><a href="/books/${book.id}">${book.title}</a></td>
      <td><a href="/authors/${book.author.id}">${book.author}</a></td>
    </tr>
  `
  return html
}

Category.prototype.displayBookCategory = function() {
  let html = ` <a href="/categories/${this.id}">${this.name}</a> ||`
  return html
}


// CATEGORIES#SHOW "NEXT"

function showNextCategory(e) {
  let $id = parseInt($(e.currentTarget).attr("data-category-id"));
  $.get(`/categories/${$id}/next`, category => {
    let newCategory = new Category(category);
    newCategory.showPage();
    history.pushState(null, null, `${newCategory.id}`);
  });
};


// CREATE CATEGORY VIA BOOKS#SHOW

function showCategoryForm(e) {
  e.preventDefault();
  $("#add-category-form").toggle();
};

function createCategory(bookId, values) {
  let posting = $.post(`/books/${bookId}/categories.json`, values);
  posting.done(function(category) {
    showNewCategory(category)
    $("#new-category-field").val('')
  });
}

function showNewCategory(category) {
  let newCategory = new Category(category);
  let categoryText = newCategory.displayBookCategory();
  $("#book-categories-list").append(categoryText);
  $("#add-category-form").hide();
}
