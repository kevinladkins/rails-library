class CategoriesController < ApplicationController

before_action :authorize_user, only: [:new, :create]


  def index
    @categories = Category.find_each
  end
  
  
  def show
    @category = Category.find(params[:id])
  end
  
  def new
    @book = Book.find(params[:book_id])
    @category = Category.new
  end
  
  def create
    @book = Book.find(params[:book_id])
    @category = @book.categories.build(category_params)
    @book.save ? redirect_to(book_path(@book)) : render('new')
  end
  
  private 
  
  def category_params
    params.require(:category).permit(:name, :classification)
  end



end