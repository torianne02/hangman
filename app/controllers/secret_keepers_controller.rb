class SecretKeepersController < ApplicationController
  before_action :set_guesser
  
  # POST /guessers/:id/
  def create 
    @guesser.secret_keepers.create!(secret_keeper_params)
    json_response(@guesser, :created)
  end

  private

  def secret_keeper_params
    params.permit(:word, :guesser_id, :guesses)
  end

  def set_guesser
    @guesser = Guesser.find(params[:guesser_id])
  end 
end