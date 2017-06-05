"use strict";

// PAGE SETUP & EVENT LISTENERS

$(function() {
  setCategoryListeners();
  $("#add-category-form").hide();
});

function setCategoryListeners() {
  $("#next-category").click(function(e) {
    showNextCategory(e);
  });
   $("#create-category-button").click(function(e) {
     showCategoryForm(e);
  });
};

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
    <li><a href="/books/${book.id}">${book.title}</a> by <a href="/authors/${book.author.id}">${book.author}</a></li>
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
     $("#add-category-form form").submit(function(e) {
       e.preventDefault();
       var values = $(this).serialize();
       var $book_id = $(this).attr("data-book-id")
       var posting = $.post(`/books/${$book_id}/categories.json`, values)
       posting.done(function(category) {
         showNewCategory(category)
       })
     })
   };

   function showNewCategory(category) {
     let newCategory = new Category(category);
     let categoryText = newCategory.displayBookCategory();
     $("#book-categories-list").append(categoryText);
     $("#add-category-form").hide();
   }
