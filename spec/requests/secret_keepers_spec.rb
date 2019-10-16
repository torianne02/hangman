require 'rails_helper'

RSpec.describe SecretKeepersController do
  let!(:guesser) { create(:guesser) }
  let(:guesser_id) { guesser.id }
  let!(:secret_keepers) { create_list(:secret_keeper, 5, guesser_id: guesser_id)}
  let(:id) { secret_keepers.first.id }

  # test suite for POST /guessers/:guesser_id/secret_keepers
  describe 'POST /guessers/:guesser_id/secret_keepers' do 
    let (:valid_attr) do 
      { word: 'apple', guesses: [] }
    end 

    context 'when request attributes are valid' do 
      before { post "/guessers/#{guesser_id}/secret_keepers", params: valid_attr }

      it 'returns status code 201' do 
        expect(response).to have_http_status(201)
      end 
    end 

    context 'when an invalid request' do 
      let(:invalid_attr) { { word: nil} }
      before { post "/guessers/#{guesser_id}/secret_keepers", params: invalid_attr }

      it 'returns code 422' do 
        expect(response).to have_http_status(422)
      end 

      it 'returns a failure message' do 
        expect(json['message']).to match(/Validation failed: Word can't be blank/)
      end 
    end 
  end # POST 

  # test suite for GET /guessers/:guesser_id/secret_keepers/:id 
  describe 'GET /guessers/:guesser_id/secret_keepers/:id' do 
    before { get "/guessers/#{guesser_id}/secret_keepers/#{id}", params: {} }

    context 'when guesser secret_keeper exists' do 
      it 'returns status code 200' do 
        expect(response).to have_http_status(200)
      end 

      it 'returns the secret_keeper' do 
        expect(json['id']).to eq(id)
      end 
    end 
  end # GET /guessers/:guesser_id/secret_keepers/:id
end # RSpec