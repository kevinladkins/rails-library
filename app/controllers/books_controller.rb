class BooksController < ApplicationController

  def index
    binding.pry
    params[:author_id] ? @books = Author.find(params[:author_id]).books : @books = Book.all
  end

  def new
  end

  def create
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

end
