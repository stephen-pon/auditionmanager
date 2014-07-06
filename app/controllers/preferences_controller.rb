class PreferencesController < ApplicationController

  before_filter :authenticate_user

  def new
    @preference = Preference.new()
    @preference.save
  end

  def show
    @preference = Preference.find_by_id(params[:id])
    @auditionees = @preference.auditionees
    @director = Director.find_by_id(@preference.director_id)
  end

  def add_auditionee
    @preference = Preference.find_by_id(params[:id])
    found_auditionee = Auditionee.find_by_id(params[:auditionee_id])
    if found_auditionee == nil
      flash[:notice] = "Warning: Casting number doesn't exist"
    else
      @preference.auditionees << found_auditionee
      @preference.save
    end
    redirect_to @preference
  end

  def remove_auditionee
    @preference = Preference.find_by_id(params[:id])
    curr_auditionee = Auditionee.find_by_id(params[:auditionee_id])
    @preference.auditionees.delete(curr_auditionee)
    redirect_to @preference
  end

end
