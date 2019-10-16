class GuessersController < ApplicationController
  before_action :set_guesser, only: [:show, :update, :destory]

  # POST /signup
  def create 
    @guesser = Guesser.create!(guesser_params)
    response = { message: Message.account_created }
    json_response(response, :created)
  end

  # GET /guessers/:id
  def show 
    json_response(@guesser)
  end 

  private

  def guesser_params 
    params.permit(:initials, :password)
  end 

  def set_guesser 
    @guesser = Guesser.find(params[:id])
  end 
end 