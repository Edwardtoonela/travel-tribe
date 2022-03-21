class TripsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_trip, only: %i[show edit update destroy]

    def show
      @booking = Booking.new
      @bookmark = Bookmark.new
      @user_bookmark = @trip.bookmarks.find_by(user: current_user)
      @chat = Chatroom.find_by_name(@trip.name)
      @review = Review.new
    end


  def new
    @trip = Trip.new
    authorize @trip
  end

  def edit
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    Chatroom.create(name: @trip.name)
    @chat = Chatroom.find_by_name(@trip.name)

    authorize @trip
    if @trip.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    chat = Chatroom.find_by(name: @trip.name)
    if @trip.update(trip_params)
      chat.name = @trip.name
      chat.save
      redirect_to @trip, notice: 'trip was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @trip.destroy
    redirect_to trips_url, notice: 'trip was successfully destroyed.'
  end

  private

  # def user_status
  #   user_signed_in?
  # end

  def set_trip
    @trip = Trip.find(params[:id])
    authorize @trip
  end

  def trip_params
    params.require(:trip).permit(:start_date, :end_date, :description, :address, :photo, :name, :price_min,
                                 :price_max, :max_guests)
  end
end
