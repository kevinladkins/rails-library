class AuthorsController < ApplicationController

  before_action :authorize_user, only: [:new, :create, :edit, :update, :destroy]


  def index
    if params[:query]
      query_author = Author.find_by(name: params[:query])
      query_author ? redirect_to(query_author) : set_authors
    else
      set_authors
      respond_to do |f|
        f.html {render :index}
        f.json {render json: @authors}
      end
    end
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    @author.save ? redirect_to(@author) : render('new')
  end

  def show
    set_author
    respond_to do |f|
      f.html {render :show}
      f.json {render json: set_author}
    end
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
    params.require(:author).permit(:first_name, :last_name, :born, :died, :bio)
  end

  def set_author
    @author = Author.find(params[:id])
  end

  def set_authors
    @authors = Author.name_search(params[:query])
  end



end
