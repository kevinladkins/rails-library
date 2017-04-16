class AuthorsController < ApplicationController

  before_action :authorize_user, only: [:new, :create, :edit, :update, :destroy]


  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def create
    raise params.inspect
  end

  def show
    @author = Author.find(params[:id])
  end

  def edit
  end

  def update
  end



end
