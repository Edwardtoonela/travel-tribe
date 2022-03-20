class ReviewsController < ApplicationController
  require 'date'
  before_action :find_trip, only: %i[new create edit update]
  before_action :find_review, only: %i[edit update destroy]

  def new
    @review = Review.new
    authorize @review
  end

  def index
    @reviews = policy_scope(Bookmark)
    authorize @reviews
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

  def edit
    authorize @review
  end

  def update
    @review = Review.find(params[:id])

    authorize @review

    if @review.update(review_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @review = Review.find(params[:id])

    authorize @review

    @review.destroy
    redirect_to review_user_path
    flash[:notice] = "Your review was successfully deleted."
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

  def find_review
    @review = Review.find(params[:id])
  end
end
