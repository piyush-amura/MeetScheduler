# Class AgendasController provides all the functionality
# related to agenda
#
# @author Piyush Wani <piyush.wani@amuratech.com>
#
class AgendasController < ApplicationController
  before_action only: %i[edit update] do
    @agenda = Agenda.where(id: params[:id]).first
  end

  def new
    @mom_id = params[:mom_id]
  end

  def create
    puts params[:agenda]
    @agenda = Agenda.new(agenda_params)
    redirect_to(agendas_path) && return if @agenda.save!
    render 'new'
  end

  def edit; end

  def update
    redirect_to(agendas_path) && return if @agenda.update(agenda_params)
    render 'edit'
  end

  def destroy
    redirect_to(agendas_path) if Agenda.find(params[:id]).destroy
  end

  def index
    @agendas = Agenda.all
  end

  def agenda_params
    params.require(:agenda).permit(:name, :mom_id, :status, :allocated_time, :action)
  end
end
