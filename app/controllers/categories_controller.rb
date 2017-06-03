class CategoriesController < ApplicationController

before_action :authorize_user, only: [:new, :create]


  def index
    @categories = Category.find_each
  end


  def show
    set_category
    respond_to do |f|
      f.html {render :show}
      f.json {render json: @category}
    end
  end

  def next
    binding.pry
    render json: Category.next(params[:id].to_i)
  end

  def new
    @book = Book.find(params[:book_id])
    @category = Category.new
  end

  def create
    @book = Book.find(params[:book_id])
    @category = @book.categories.build(category_params)
    @category.classification = @book.classification
    @book.save ? redirect_to(book_path(@book)) : render('new')
  end

  private

  def category_params
    params.require(:category).permit(:name, :classification)
  end

  def set_category
      @category = Category.find(params[:id])
  end



end
