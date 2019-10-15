class GuessersController < ApplicationController
  # POST /signup
  def create 
    # binding.pry
    @guesser = Guesser.create!(guesser_params)

    response = { message: Message.account_created }

    json_response(response, :created)
  end


  private

  def guesser_params 
    params.permit(:initials, :password)
  end 

end 