module AveragePriceHelper
  def average_price
    sum_price = @trip.price_max + @trip.price_min
    average = sum_price / 2
    average
  end
end
