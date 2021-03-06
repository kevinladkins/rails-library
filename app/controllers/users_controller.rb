class UsersController < ApplicationController

  before_action :authorize_user, only: [:index, :edit, :update, :destroy]
  before_action :require_login, only: [:show]


  def index
    set_users
    if params[:query]
      query_user = User.find_by(name: params[:query])
      redirect_to(query_user) if query_user
    else
      respond_to do |f|
        f.html {render :index}
        f.json {render json: User.all.as_json(only: [:name])}
      end
    end
  end


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save ? redirect_to(login_path) : render('new')
  end

  def show
    @user = User.find(params[:id])
    if @user != current_user && !current_user.librarian?
      flash.alert = "You cannot view another user's account"
      redirect_to root_path
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.outstanding_loans?
       flash.alert = "User #{user.name}'s still has outstanding loans."
       redirect_to user_path(user)
    else
			user.destroy
			flash.alert = "User #{user.name}'s account has been deleted."
			redirect_to dashboard_index_path
		end
  end


  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :email, :password, :password_confirmation, :role)
  end

  def require_login
    if !logged_in?
      flash.alert = "Please log in to view your account."
      redirect_to root_path
    end
  end

  def set_users
    @users = User.name_search(params[:query])

  end

end
