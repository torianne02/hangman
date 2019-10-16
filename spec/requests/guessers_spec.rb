require 'rails_helper'

RSpec.describe GuessersController, type: :request do 
  # initialize test data for sign-up/sign-in
  let(:guesser) { create(:guesser) }
  let(:guesser_id) { guesser.id }
  let(:guesser_valid_attr) do
    attributes_for(:guesser)
  end 

  # test suite for guesser sign-up
  describe 'POST /signup' do
    context 'when valid request' do
      before { post '/signup', params: guesser_valid_attr }

      it 'creates a new guesser' do 
        expect(response).to have_http_status(201)
      end

      it 'returns success message' do
        expect(json['message']).to match(/Account created successfully/)
      end
    end

    context 'when invalid request' do
      before { post '/signup', params: {} }

      it 'does not create a new guesser' do 
        expect(response).to have_http_status(422)
      end 

      it 'returns a failure message' do
        expect(json['message']).to match(/Validation failed: Password can't be blank, Initials can't be blank/)
      end 
    end 
  end # POST signup 

  # test suite for GET /guessers/:id
  describe 'GET /guessers/:id' do
    before { get "/guessers/#{guesser_id}", params: {} }

    context 'when the record exists' do
      it 'returns the user' do 
        expect(json).not_to be_empty
        expect(json['id']).to eq(guesser_id)
      end 

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end 

    context 'when the record does not exist' do
      let(:guesser_id) { 100000 }

      it 'returns status code 404' do 
        expect(response).to have_http_status(404)
      end 

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Guesser/)
      end 
    end
  end # GET guessers/:id

  # test suite for PUT /guessers/:id
  describe 'PUT /guessers/:id' do
    let(:valid_attr) { { initials: 'NBM' } }

    context 'when the record updates' do
      before { put "/guessers/#{guesser_id}", params: valid_attr }

      it 'updates the record' do
        expect(response.body).to be_empty 
      end 

      it 'returns status code 204' do 
        expect(response).to have_http_status(204)
      end 
    end
  end # PUT guessers/:id

  # test suite for DELETE /guessers/:id
  describe 'DELETE /guessers/:id' do 
    before { delete "/guessers/#{guesser_id}", params: {} }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end 
  end # DELETE guessers/:id
end # RSpec 