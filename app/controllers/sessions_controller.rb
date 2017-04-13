class SessionsController < ApplicationController

  def new

  end

  def create
  end


  def destroy
    session.delete :name
    redirect_to root_path
  end

end
