class ReviewsController < ApplicationController
  require 'date'

  def create
    @review = Review.new(review_params)
    @trip = Trip.find(params[:trip_id])
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
    params.require(:review).permit(%i[comment rating])
  end
end
