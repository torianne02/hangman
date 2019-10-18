class SessionsController < ApplicationController
  before_action :current_guesser, except: %i[new create]

  def new 
    @guesser = Guesser.new 
  end 

  def create 
    @guesser = Guesser.find_by(initials: params[:initials])

    if @guesser && @guesser.authenticate(params[:password])
      session[:guesser_id] = @guesser.id
      redirect_to guesser_path(@guesser)
    else 
      redirect_to signin_path, notice: 'Initials and password do not match.'
    end 
  end 

  def destroy 
    session.delete :guesser_id 
    redirect_to root_url, notice: "You have successfully logged out."
  end
end 