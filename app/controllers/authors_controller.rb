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
    set_author
  end

  def edit
    set_author
  end

  def update
    set_author.update(author_params)
    redirect_to set_author
  end

  private

  def author_params
    params.require(:author).permit(:name, :born, :died, :bio)
  end

  def set_author
    @author = Author.find(params[:id])
  end



end
