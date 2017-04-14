class BooksController < ApplicationController

  def index
    params[:author_id] ? set_author_books_view : set_books_view
  end

  def new
    @book = Book.new
  end

  def create
    raise params.inspect
  end

  def show
    @book = Book.find_by(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_books_view
    @books = Book.all
  end

  def set_author_books_view
    @author = Author.find(params[:author_id])
  end
end
