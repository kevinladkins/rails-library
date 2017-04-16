class UsersController < ApplicationController


  def index
  end


  def new
    @user = User.new
  end

  def create
    raise params.inspect
  end

end
