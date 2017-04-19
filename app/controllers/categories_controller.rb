class CategoriesController < ApplicationController

before_action :authorize_user, only: [:new, :create]


  def index
    @categories = Category.all
  end
  
  
  def show
    @category = Category.find(params[:id])
  end
  
  def new
    @category = Category.new
    @book = Book.find(params[:book_id])
  end
  
  def create
    @book = Book.find(params[:book_id])
    @category = @book.categories.build(category_params)
    if @book.save
      redirect_to book_path(@book)
    else
       render 'new'
    end  
  end
  
  private 
  
  def category_params
    params.require(:category).permit(:name, :classification)
  end



end