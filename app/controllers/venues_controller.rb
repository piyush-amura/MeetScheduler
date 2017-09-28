# Class VenuesController provides CRUD functionality for venue
#
# @author Piyush Wani <piyush.wani@amuratech.com>
#
class VenuesController < ApplicationController
  # before_action :authenticate_user!
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
    respond_to do |format|
      format.json { render json: @venues }
      format.html { render 'index' }
    end
  end

  # method that creates the venue object and add its to Venue model
  #
  #
  # @return response body html or any other formats (json, xml)
  #
  def create
    @venue = Venue.new(venue_params)
    # redirect_to(venues_path) && return if @venue.save
    # render 'new'
    if @venue.save
      respond_to do |format|
        format.json { render json: Venue.all }
        format.html { redirect_to(venues_path) }
      end
    else
      render 'new'
    end
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
    if @venue.update(venue_params)
      respond_to do |format|
        format.json { render json: Venue.all }
        format.html { redirect_to(venues_path) }
      end
    else
      render 'edit'
    end
  end

  # method that destroys venue object
  #
  #
  def destroy
    # redirect_to(venues_path) if Venue.find(params[:id]).destroy
    Venue.find(params[:id]).destroy
    respond_to do |format|
      format.json { render json: Venue.all }
      format.html { render 'index' }
    end
    # render 'index'
  end

  # show method return object of venue
  #
  #
  # @return [Venue] venue object
  #
  def show
    @venue = Venue.where(id: params[:id]).first
    respond_to do |format|
      format.json { render json: @venue }
      format.html
    end
  end

  # <method for searching>
  #
  #
  # @return [<Array>] <Array of Venue Objects that are matching with keywords>
  #
  def search
    param = params[:name]
    @venues = Venue.where( { name: /^#{param}/ } )
    respond_to do |format|
      format.json { render json: @venues }
    end
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
