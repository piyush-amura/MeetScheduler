# Class VenuesController provides CRUD functionality for venue
#
# @author Piyush Wani <piyush.wani@amuratech.com>
#
class VenuesController < ApplicationController

  before_action only: %i[edit update] do
    @venue = Venue.where(id: params[:id]).first
  end
  def new; end

  def index
    @venues = Venue.all
  end

  def create
    @venue = Venue.new(venue_params)
    redirect_to(venues_path) if @venue.save
    render 'new'
  end

  def edit; end

  def update
    # @venue = Venue.where(id: params[:id]).first
    redirect_to(venues_path) && return if @venue.update(venue_params)
    render 'edit'
  end

  def destroy
    redirect_to(venues_path) if Venue.find(params[:id]).destroy
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :capacity, :address, :status)
  end
end
