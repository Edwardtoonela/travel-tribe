class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if params[:query].blank?
      @trips = policy_scope(Trip)
    else
     # @parameter = trip_params[:search].downcase
      @trips = policy_scope(Trip).search_keyword(params[:query])
    end
  end
end
