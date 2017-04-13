class SessionsController < ApplicationController

  def new

  end

  def create
    raise request.env['omniauth.auth'].inspect
  end


  def destroy
    session.delete :name
    redirect_to root_path
  end

end
