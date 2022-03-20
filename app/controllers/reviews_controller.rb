class ReviewsController < ApplicationController
  require 'date'
  before_action :find_trip

  def new
    @review = Review.new
    authorize @review

  end

  def create
    @review = Review.new(review_params)
    @review.trip = @trip
    @review.user = current_user
    authorize @review

    if @review.save
      redirect_to trip_path(@trip)
      flash[:notice] = "Your review is done"
    else
      flash[:alert] = "Oops!! You need to fill in the form!"
      render 'trips/show'
    end
  end

  def destroy
    authorize current_user
    @review = Review.find(review)
    @review.destroy
    redirect_to users,
    flash[:notice] = "Your review was successfully canceled."
  end

  private

  def review_params
    params.require(:review).permit(%i[comment rating title])
  end

  def find_trip
    @trip = Trip.find(params[:trip_id])
  end

  def find_user
    @user = User.find(params[:user_id])
  end
end
