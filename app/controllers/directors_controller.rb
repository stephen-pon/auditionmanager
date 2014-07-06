class DirectorsController < ApplicationController

  before_filter :authenticate_user, :only => [:show]
  before_filter :save_login_state, :only => [:new, :create]
  http_basic_authenticate_with name: "Stephen", password: "A5014FIG", only: :index

  def index
    @directors = Director.all
  end

  def show
    @director = Director.find(params[:id])
    @preference = @director.preference
    @roster = @director.roster
  end

  def new
    @director = Director.new
  end

  def create
    @director = Director.new(director_params)

    if @director.save
      new_roster = Roster.new()
      new_roster.save()
      @director.roster = new_roster
      new_preference = Preference.new()
      new_preference.save()
      @director.preference = new_preference
      @director.save
      redirect_to 'index'
    else
      render 'new'
    end
  end

  private 
    def director_params
      params.require(:director).permit(:name, :password)
    end

end
