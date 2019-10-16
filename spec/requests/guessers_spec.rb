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
end # RSpec 