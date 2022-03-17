class BookingsController < ApplicationController


  def index
    #@booking = Booking.all
    @bookings = policy_scope(Booking)
    authorize @bookings

  end

  def create
    @booking = Booking.new
    @trip = Trip.find(params[:trip_id])
    @booking.trip = @trip
    @booking.user = current_user
    @booking.status = "pending"

    authorize @booking

    if @booking.save
      redirect_to trip_path(@trip)
      flash[:notice] = "Your booking is done"
      UserMailer.with(user: @trip.user).join.deliver_now
    else
      flash[:alert] = "Oops!! Something went wrong"
      render 'trips/show'
    end

  end

  def destroy
    authorize current_user
    @booking = Booking.find(booking)
    @booking.destroy
    redirect_to users,
    flash[:notice] = "Your booking was successfully canceled."
  end

  def accept
    @booking = Booking.find(booking)
    @booking.status = "confirmed"
  end
end
