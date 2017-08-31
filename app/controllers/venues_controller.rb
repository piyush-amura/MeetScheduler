# Class VenuesController provides CRUD functionality for venue
#
# @author Piyush Wani <piyush.wani@amuratech.com>
#
class VenuesController < ApplicationController
  before_action :authenticate_user!
  before_action only: %i[edit update] do
    @venue = Venue.where(id: params[:id]).first
  end

  # method that renders the venue create view
  #
  #
  def new; end

  # method provides list of all venues and renders index view
  #
  #
  # @return @venues array of venues
  #
  def index
    @venues = Venue.all
  end

  # method that creates the venue object and add its to Venue model
  #
  #
  # @return response body html or any other formats (json, xml)
  #
  def create
    @venue = Venue.new(venue_params)
    redirect_to(venues_path) if @venue.save
    render 'new'
  end

  # method that provide edit view and venue object up for updatation
  #
  #
  # @return venue object
  #
  def edit; end

  # method that updates the venue object given by edit
  #
  #
  # @return response body html or any other formats (json, xml)
  #
  def update
    redirect_to(venues_path) && return if @venue.update(venue_params)
    render 'edit'
  end

  # method that destroys venue object
  #
  #
  def destroy
    redirect_to(venues_path) if Venue.find(params[:id]).destroy
  end

  private

  # private method used for implementing strong params to
  # prevent mass assignment
  #
  # @return list of item permitted at the time of mass assignment
  #
  def venue_params
    params.require(:venue).permit(:name, :capacity, :address, :status)
  end
end
