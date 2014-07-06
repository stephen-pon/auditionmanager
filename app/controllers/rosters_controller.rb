class RostersController < ApplicationController

  before_filter :authenticate_user

  def new
    @roster = Roster.new()
  end

  def create
    @roster = Roster.new()
    @roster.save()
  end

  def show
    @roster = Roster.find_by_id(params[:id])
    @auditionees = @roster.auditionees
    @director = Director.find_by_id(@roster.director_id)
  end

end
