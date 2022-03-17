class TripsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index, :show]
    before_action :set_trip, only: [:show, :edit, :update, :destroy]

    def show
      authorize @trip
      @booking = Booking.new
      @chat = Chatroom.find_by_name(@trip.name)
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
      # @chat = Chatroom.find_by_name(@trip.name)

      authorize @trip
      if @trip.save
        redirect_to root_path
      else
        render :new
      end
    end

    def update
      authorize @trip
      if @trip.update(trip_params)
        redirect_to @trip, notice: 'trip was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      authorize @trip
      @trip.destroy
      redirect_to trips_url, notice: 'trip was successfully destroyed.'
    end

    private

    # def user_status
    #   user_signed_in?
    # end

    def set_trip
      @trip = Trip.find(params[:id])
    end

    def trip_params
      params.require(:trip).permit(:start_date, :end_date, :description, :location, :photo, :name, :price_min, :price_max, :max_guests)
    end
end
