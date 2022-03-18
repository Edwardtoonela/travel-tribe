class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if params[:query].blank?
      @trips = policy_scope(Trip)
    else
     # @parameter = trip_params[:search].downcase
      @trips = policy_scope(Trip).algolia_search(params[:query])
      ids = @trips.map do |trip|
        trip.id
      end
      @trips = Trip.where(id: ids)
    end

    # the `geocoded` scope filters only trips with coordinates (latitude & longitude)
    @markers = @trips.geocoded.map do |trip|
      {
        lat: trip.latitude,
        lng: trip.longitude,
        # info_window: render_to_string(partial: 'info_window', locals: { trip: trip })
      }
    end
  end
end
