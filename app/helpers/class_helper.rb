module ClassHelper
  def booking_status(booking)
    css_class = "pending"

    if booking.status == "confirmed"
      css_class = "confirmed"
    elsif booking.status == "rejected"
      css_class = "rejected"
    end
    css_class
  end
end
