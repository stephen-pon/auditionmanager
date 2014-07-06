class AuditioneesController < ApplicationController

  before_filter :authenticate_user, :only => [:search]

  def new
    @auditionee = Auditionee.new
  end

  def create
    @auditionee = Auditionee.new(auditionee_params)

    if @auditionee.save
      redirect_to @auditionee
    else
      render 'new'
    end
  end

  def show
    auditionee = Auditionee.find(params[:id])
    @cast_num = auditionee.id
  end

  def index
    @auditionees = Auditionee.all
  end

  def search
    @search = Auditionee.search do
      fulltext params[:search]
    end
    @auditionees = @search.results
  end

  def remove_ungrouped
    all_auditionees = Auditionee.all
    all_auditionees.each do |auditionee|
      if auditionee.casting_group_id == nil
        Auditionee.delete(auditionee)
      end
    end
    @auditionees = Auditionee.all
    render 'index'
  end
  

  private 
    def auditionee_params
      params.require(:auditionee).permit(:first_name, :last_name, :phone_number, :facebook_url, :email, :gender)
    end

end
