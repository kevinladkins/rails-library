class AuthorsController < ApplicationController

  before_action :authorize_user, only: [:new, :create, :edit, :update, :destroy]


  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to @author
    else
      render 'new'
    end
  end

  def show
    @author = Author.find(params[:id])
  end

  def edit
  end

  def update
  end

  private

  def author_params
    params.require(:author).permit(:name, :born, :died, :bio)
  end



end
