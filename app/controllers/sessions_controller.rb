class SessionsController < ApplicationController

  def new

  end

  def create
    login
    current_user ? redirect_to_root_path : render 'new'
  end


  def destroy
    session.delete :user_id
    redirect_to root_path
  end

  private

  def sessions_params
    params.require(:user).permit(:email, :password)
  end

  def login
    request.env['omniauth.auth'] ? omniauth_authenticate : bcrypt_authenticate
  end

  def omniauth_authenticate
    session[:user_id] = User.find_or_create_by_omniauth(auth).id
  end

  def auth
    request.env['omniauth.auth']['info']
  end

  def bcrypt_authenticate
      user = User.find_by(email: params[:user][:email])
      if user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
      else
        flash.alert = "Login failed. Please try again or create an account."
      end
  end

end
