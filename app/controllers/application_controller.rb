class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_guesser, except: [:home]
  before_action :require_logged_in, except: %i[new create home]
  helper_method :current_guesser 

  include Response
  include ExceptionHandler

  def logged_in?
    !!current_guesser
  end 

  private

  def require_logged_in
    redirect_to root_path unless logged_in?
  end 

  def current_guesser
    @current_guesser ||= Guesser.find(session[:guesser_id]) if session[:guesser_id]
  end 
end
