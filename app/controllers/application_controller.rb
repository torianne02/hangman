class ApplicationController < ActionController::Base
  before_action :current_guesser, except: [:home]
  helper_method :current_guesser 
  include Response
  include ExceptionHandler

  def logged_in?
    !!current_guesser
  end 

  private

  def current_guesser
    @current_guesser ||= Guesser.find(session[:guesser_id]) if session[:guesser_id]
  end 
end
