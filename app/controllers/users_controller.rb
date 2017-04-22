class UsersController < ApplicationController

  before_action :authorize_user, only: [:index, :edit, :update, :destroy]
  before_action :require_login, only: [:show]


  def index
    @users = User.all.order(:last_name)
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
    user.destroy
    flash.alert = "User #{user.name}'s account has been deleted."
    redirect_to dashboard_index_path
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

end
