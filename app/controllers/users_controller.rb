class UsersController < ApplicationController

  def show
    authorize current_user
  end

  # def edit
  #   render :edit
  # end
#
  # def profile
  #   render :profile
  # end

end
