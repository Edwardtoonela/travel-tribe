class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
  end
#
  # def profile
  #   render :profile
  # end

  private

  def user_params
    params.require(:user).permit(:full_name, :email, :password, :user_name, :photo)
  end

end
