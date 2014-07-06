class SessionsController < ApplicationController

  def new
  end

  def create
    director = Director.authenticate(params[:username], params[:password])
    if director
      session[:director_id] = director.id
      redirect_to director
    else
      render 'new'
    end
  end

  def destroy
    session[:director_id] = nil
    redirect_to root_url
  end

end
