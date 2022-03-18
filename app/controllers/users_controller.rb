class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  # def edit
  #   render :edit
  # end
#
  # def profile
  #   render :profile
  # end

end
