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
    m = Mom.new(summary: 'default')
    m.meeting = meeting
    m.save!
    redirect_to(users_employees_meetings_url)
  end

  def index
    @past_meetings = current_user.past_meetings
    @upcoming_meetings = current_user.upcoming_meetings
    @organised_meetings = current_user.organised_meetings 
    p @user_id
  end

  def destroy
    redirect_to(users_employees_meetings_url) if Meeting.find(params[:id]).destroy
  end

  def add_members
    if request.post?
      params.require(:selected).permit!
      meet = Meeting.where(id: params[:meeting_id]).first
      s = []
      params[:selected].to_h.each do |k, v|
        s.push(k) if v == '1'
      end
      s.each { |id| meet.members << User.find(id) }
      redirect_to(users_employees_meetings_url)
    else
      @users = User.all
      @meeting_id = params[:id]
      meet = Meeting.find(@meeting_id)
      @included_members = meet.members
      @remaining_members = (User.all.to_a - meet.members.to_a).to_a
    end  
  end

  def remove_members
    if request.post?
      params.require(:selected).permit!
      meet = Meeting.where(id: params[:meeting_id]).first
      s = []
      params[:selected].to_h.each do |k, v|
        s.push(k) if v == '1'
      end
      s.each { |id| meet.members.delete(User.find(id)) }
      redirect_to(users_employees_meetings_url)
    else
      @users = User.all
      @meeting_id = params[:id]
      meet = Meeting.find(@meeting_id)
      @included_members = meet.members
    end  
  end

  private

  def meeting_params
    params.require(:meeting).permit(:key_note, :date, :start_time,:duration, :status, :venue_id)
  end
  
end
