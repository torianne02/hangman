require 'rails_helper'

RSpec.describe SecretKeepersController do
  let!(:guesser) { create(:guesser) }
  let(:guesser_id) { guesser.id }
  let(:id) { secret_keeper.id }

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


end # RSpec