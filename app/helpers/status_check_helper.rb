module StatusCheckHelper
  def check_status

    booking = @trip.bookings.where(user: current_user).first
    if !(booking.nil?) && booking.status == "confirmed"
      return true
    else
      return false
    end
  end

end
