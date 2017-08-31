# Class Users::Employees::MeetingsController provides <description>
#
# @author Piyush Wani <piyush.wani@amuratech.com>
#
class Users::Employees::MeetingsController < ApplicationController
  before_action :authenticate_user!
  before_action only: %i[new edit] do
    @venues = Venue.all.pluck(:name, :id).to_h
    @status_list = %w[on\ time delayed canceled]
  end

  before_action only: %i[edit update] do
    @meeting = Meeting.where(id: params[:id]).first
  end

  def new; end

  def edit; end

  def update
    redirect_to(users_employees_meetings_path) && return if @meeting.update(meeting_params)
    render 'edit'
  end

  def create
    meeting = Meeting.new(meeting_params)
    meeting.organiser = current_user
    meeting.save!
    redirect_to(users_employees_meetings_url)
  end

  def index
    @meetings = Meeting.all
    p @user_id
  end

  def destroy
    redirect_to(users_employees_meetings_url) if Meeting.find(params[:id]).destroy
  end

  private

  def meeting_params
    params.require(:meeting).permit(:key_note, :date, :start_time,:duration, :status, :venue_id)
  end
end
