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
    params.require(:agenda).permit!
    mom_id = params[:agenda][:mom_id]
    @agenda = Agenda.new(agenda_params)
    if @agenda.save!
      redirect_to agendas_path(mom_id: mom_id)
    else
    render 'new'
    end
  end

  def edit; end

  def update
    mom_id = params[:agenda][:mom_id]
    if @agenda.update(agenda_params)
      redirect_to agendas_path(mom_id: mom_id)
    else
      render 'edit'
    end
  end

  def destroy
    m_id = params[:mom_id]
    redirect_to agendas_path(mom_id: m_id) if Agenda.find(params[:id]).destroy
  end

  def index
    if params[:mom_id].nil?
      @agendas=Agenda.all
    else
      @agendas = Agenda.where(mom_id: params[:mom_id])
    end  
  end

  def agenda_params
    params.require(:agenda).permit(:name, :mom_id, :status, :allocated_time, :action)
  end
end
