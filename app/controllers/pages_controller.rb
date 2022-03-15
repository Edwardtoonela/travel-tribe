class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if params[:query].blank?
      @trips = policy_scope(Trip)
    else
     # @parameter = trip_params[:search].downcase
      @trips = policy_scope(Trip).algolia_search(params[:query])
    end
  end
end
