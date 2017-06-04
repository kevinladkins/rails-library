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
    render json: Category.next(params[:id].to_i)
  end

  def new
    @book = Book.find(params[:book_id])
    @category = Category.new
  end

  def create
    @book = Book.find(params[:book_id])
    if @category = Category.find_by(name: params[:category][:name])
      @book.categories << @category
      @book.save
    else
      @category = @book.categories.build(category_params)
      @category.classification = @book.classification
      @category.save
    end
    respond_to do |f|
      f.html {redirect_to(book_path(@book))}
      f.json {render json: @category}
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :classification)
  end

  def set_category
      @category = Category.find(params[:id])
  end



end
