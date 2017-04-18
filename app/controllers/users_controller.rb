class UsersController < ApplicationController

  before_action :authorize_user, only: [:index, :edit, :update]


  def index
    @users = User.all
  end


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    if @user != current_user && !current_user.librarian?
      flash.alert = "You cannot view another user's account"
      redirect_to root_path
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
  end

end
