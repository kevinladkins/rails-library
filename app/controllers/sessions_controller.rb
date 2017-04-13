class SessionsController < ApplicationController

  def new

  end

  def create
    login(params)
    binding.pry
    redirect_to root_path
  end


  def destroy
    session.delete :name
    redirect_to root_path
  end

  private

  def sessions_params
    params.require(:user).permit(:email, :password)
  end

  def login(params)
    if params[:user]
      @user = User.find_by(email: params[:user][:email])
      if @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
    end
  end
end

end
