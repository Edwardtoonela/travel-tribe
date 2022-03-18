class BookmarksController < ApplicationController

  def index
    @bookmarks = policy_scope(Bookmark)
    authorize @bookmarks
  end

  def create
    @bookmark = Bookmark.new
    @trip = Trip.find(params[:trip_id])
    @bookmark.trip = @trip
    @bookmark.user = current_user

    authorize @bookmark

    if @bookmark.save
      flash[:notice] = "Your bookmark is done"
      redirect_to trip_path(@trip)
    else
      flash[:alert] = "Oops!! Something went wrong"
      redirect_to trip_path(@trip)
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark

    @bookmark.destroy

  end
end
