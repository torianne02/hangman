class SecretKeepersController < ApplicationController
  before_action :set_guesser
  before_action :set_secret_keeper, only: [:show, :update]
  
  # POST /guessers/:guesser_id/secret_keepers
  def create 
    @guesser.secret_keepers.create!(secret_keeper_params)
    json_response(@guesser, :created)
  end

  # GET /guessers/:guesser_id/secret_keepers/:id
  def show 
    json_response(@secret_keeper)
  end 

  private

  def secret_keeper_params
    params.permit(:word, :guesser_id, :guesses)
  end

  def set_guesser
    @guesser = Guesser.find(params[:guesser_id])
  end 

  def set_secret_keeper
    @secret_keeper = SecretKeeper.find(params[:id])
  end 
end