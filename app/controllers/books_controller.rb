class BooksController < ApplicationController

  before_action :authorize_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_book, only: [:show, :edit, :update]

  def index
    params[:author_id] ? set_author_books_view : set_books_view
  end

  def new
    @book = Book.new
  end

  def create
    binding.pry
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book
    else
      render 'new'
    end
  end

  def show

  end

  def edit
  end

  def update
    @book.update(book_params)
    redirect_to @book
  end

  def destroy
  end

  private

  def book_params
    params.require(:book).permit(:title, :publication_year, :copies, :author_id, :synopsis, :classification, author_attributes: [:name, :born, :died], :category_ids => [], categories_attributes: [:name])
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def set_books_view
    @books = Book.title_search(params[:query]).order(:title)
  end

  def set_author_books_view
    @author = Author.find(params[:author_id])
  end
end
