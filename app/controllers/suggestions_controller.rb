# Class SuggestionsController provides functionality to add,
# delete, modify suggestions
# @author Piyush Wani <piyush.wani@amuratech.com>
#
class SuggestionsController < ApplicationController
  before_action only: %i[edit update] do
    @suggestion = Suggestion.where(id: params[:id]).first
  end

  def new
    @agenda_id = params[:agenda_id]
  end

  def create
    a_id = params[:suggestion][:agenda_id]
    @suggestion = Suggestion.new(suggestion_params)
    @suggestion.user = current_user
    if @suggestion.save
      redirect_to suggestions_path(agenda_id: a_id)
    else
      render 'new'
    end
  end

  def edit; end

  def update
    a_id = params[:suggestion][:agenda_id]
    if @suggestion.update(suggestion_params)
      redirect_to suggestions_path(agenda_id: a_id)
    else
      render 'edit'
    end
  end

  def destroy
    if Suggestion.find(params[:id]).destroy
      redirect_to suggestions_path(agenda_id: params[:agenda_id])
    end
  end

  def index
    if params[:agenda_id].nil?
      @suggestions = Suggestion.all
    else
      @suggestions = Suggestion.where(agenda_id: params[:agenda_id])
    end
  end

  def suggestion_params
    params.require(:suggestion).permit(:suggestion, :agenda_id)
  end

  def show; end
end
