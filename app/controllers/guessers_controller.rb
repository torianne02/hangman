class GuessersController < ApplicationController
  before_action :set_guesser, only: %i[show update destroy]
  before_action :current_guesser, except: %i[new create]

  def new 
    @guesser = Guesser.new
  end 

  # POST /signup
  def create 
    @guesser = Guesser.create!(guesser_params)

    if @guesser 
      session[:guesser_id] = @guesser.id
      redirect_to guesser_url(@guesser)
    else  
      render :new, notice: "Please fill out all criteria."
    end 

    # code needed for tests
    response = { message: Message.account_created }
    json_response(response, :created)
  end

  # GET /guessers/:id
  def show 
    @games = @guesser.secret_keepers
    json_response(@guesser)
  end 

  def index 
    @guessers = Guesser.all
  end 

  # PUT /guessers/:id
  def update 
   if @guesser.update(guesser_params)
      redirect_to guesser_url(@guesser), notice: "Your account has been updated."
   else 
    render :edit
   end 
  end 

  # DELETE /guessers/:id
  def destroy 
    @guesser.destroy
    redirect_to root_url, notice: "Your account has been deleted."
  end

  private

  def guesser_params 
    params.permit(:initials, :password)
  end 

  def set_guesser 
    @guesser = Guesser.find(params[:id])
  end 
end 