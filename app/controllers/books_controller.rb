class BooksController < ApplicationController

  before_action :authorize_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_book, only: [:show, :edit, :update]

  def index
    set_books
    respond_to do |f|
      f.html {render :index}
      f.json {render json: @books.as_json(only: [:title, :id, :classification], include: [author: {only: [:name, :id]}])}
    end
  end

  def new
    set_new_book
  end

  def create
    @book = Book.new(book_params)
    @book.save ? redirect_to(@book) : render('new')
  end

  def show
    respond_to do |f|
      f.html {render :show}
      f.json {render json: @book}
    end
  end

  def most_borrowed
    render json: Book.most_borrowed.as_json(only: [:title, :id], include: [author: {only: [:name, :id]}])
  end

  def edit
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params) ? redirect_to(book_path(book)) : render('edit')
   end

  private

  def book_params
    params.require(:book).permit(:title, :publication_year, :copies, :author_id, :synopsis, :classification, author_attributes: [:first_name, :last_name, :born, :died, :bio], :category_ids => [], categories_attributes: [:name])
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def set_books
    if params[:author_id]
      @author = Author.find(params[:author_id])
      @books = @author.books.find_each
    else
      @books = Book.order(:title)
    end
  end

  def set_new_book
    if params[:author_id]
      @author = Author.find(params[:author_id])
      @book = @author.books.build
    else
      @book = Book.new
    end
  end

  def json_params

  end


end
