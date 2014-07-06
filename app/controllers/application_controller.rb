class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  def authenticate_user
    if session[:director_id]
      @curr_director = Director.find session[:director_id]
      return true
    else
      redirect_to(:controller => 'sessions', :action => 'new')
      return false
    end
  end

  def save_login_state
    if session[:director_id]
      redirect_to(:controller => 'director', :action => 'control_panel')
      return false
    else
      return true
    end
  end

end
