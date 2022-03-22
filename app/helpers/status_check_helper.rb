module StatusCheckHelper
  def check_status(booking)

    booking.status == "confirmed"
  end

  def current_user_booking_status(trip)

    booking = trip.bookings.where(user: current_user).first
    if !(booking.nil?) && booking.status == "confirmed"
      return true
    else
      return false
    end
  end
end
