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
      flash[:notice] = "Your booking is done"
      UserMailer.with(user: @trip.user).join.deliver_now
      redirect_to trip_path(@trip)
    else
      flash[:alert] = "Oops!! Something went wrong"
      redirect_to trip_path(@trip)
    end

  end

  def destroy
    @booking = Booking.find(params[:id])

    authorize @booking

    @booking.destroy

    redirect_to bookings_path,
    flash: { notice: "Your booking was successfully canceled." }
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.status = "confirmed"
    authorize @booking
    if @booking.save
      redirect_to bookings_path
      flash[:notice] = "The booking has been accepted"
    else
      flash[:alert] = "Oops!! Something went wrong"
      render "bookings/index"
    end
  end

  def reject
    @booking = Booking.find(params[:id])
    @booking.status = "rejected"
    authorize @booking
    if @booking.save
      redirect_to bookings_path
      flash[:notice] = "The booking has been rejected"
    else
      flash[:alert] = "Oops!! Something went wrong"
      render "bookings/index"
    end
  end
end
