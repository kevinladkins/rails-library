class BooksController < ApplicationController

  before_action :authorize_user, only: [:new, :create, :edit, :update, :destroy]

  def index

    params[:author_id] ? set_author_books_view : set_books_view
    binding.pry
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book
    else
      render 'new'
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def book_params
    params.require(:book).permit(:title, :publication_year, :quantity, :author_id, :synopsis, :classification, author_attributes: [:name, :born, :died])
  end



  def set_books_view
    @books = Book.title_search(params[:query]).order(:title)
  end

  def set_author_books_view
    @author = Author.find(params[:author_id])
  end
end
