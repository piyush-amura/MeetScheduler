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
    puts params[:suggestion]
    @suggestion = Suggestion.new(suggestion_params)
    @suggestion.user = current_user
    redirect_to(suggestions_path) && return if @suggestion.save!
    render 'new'
  end

  def edit; end

  def update
    redirect_to(suggestions_path) && return if @suggestion.update(suggestion_params)
    render 'edit'
  end

  def destroy
    redirect_to(suggestions_path) if Suggestion.find(params[:id]).destroy
  end

  def index
    @suggestions = Suggestion.all
  end

  def suggestion_params
    params.require(:suggestion).permit(:suggestion, :agenda_id)
  end

  def show
  end
end
