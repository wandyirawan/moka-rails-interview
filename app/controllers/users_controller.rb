class UsersController < ApplicationController
  skip_before_filter :authenticate_user, :only => [:new, :create]

  def show
     @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_param)
    @user.save
    redirect_to root_url
  end

  private
    def user_param
      params.require(:user).permit(:first_name, :last_name,
                                   :email, :password, 
                                   :password_confirmation)
    end 
end
