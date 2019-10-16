class GuessersController < ApplicationController
  before_action :set_guesser, only: [:show, :update, :destroy]

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

  # PUT /guessers/:id
  def update 
    @guesser.update(guesser_params)
  end 

  # DELETE /guessers/:id
  def destroy 
    @guesser.destroy
  end

  private

  def guesser_params 
    params.permit(:initials, :password)
  end 

  def set_guesser 
    @guesser = Guesser.find(params[:id])
  end 
end 