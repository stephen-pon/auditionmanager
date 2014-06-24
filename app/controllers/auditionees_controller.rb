class AuditioneesController < ApplicationController

  def new
    @auditionee = Auditionee.new
  end

  def create
    @auditionee = Auditionee.new(article_params)

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
  
  private 
    def article_params
      params.require(:auditionee).permit(:first_name, :last_name, :phone_number, :facebook_url, :email, :gender)
    end

end