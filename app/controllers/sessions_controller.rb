class SessionsController < ApplicationController
  before_action :current_guesser, except: %i[new create]

  def new 
    @guesser = Guesser.new 
  end 

  def create 
    @guesser = Guesser.find_by(initials: params[:initials])

    if @guesser && @guesser.authenticate(params[:password])
      session[:guesser_id] = @guesser.id
      return session[:guesser_id]
    end 
  end 

  def destroy 
    session.delete :guesser_id 
  end
end 