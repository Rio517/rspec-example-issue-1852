require 'rails_helper'

RSpec.describe BooksController, type: :controller do

  describe '#show with params' do

    #fails
    context 'with params' do
      it 'receives a body' do
        sample_body = {data: {title: 'book title', author: 'John Doe'}}
        post :create, params: sample_body
        expect(response).to have_http_status(:success)
        expect(response.body).to eq(sample_body.to_json.to_s)
      end
    end

    # Results in: undefined method `symbolize_keys' for "{\"data\":{\"title\":\"book title\",\"author\":\"John Doe\"}}":String
    context 'with parms.to_json' do
      it 'receives a body' do
        sample_body = {data: {title: 'book title', author: 'John Doe'}}
        post :create, params: sample_body.to_json
        expect(response).to have_http_status(:success)
        expect(response.body).to eq(sample_body.to_json.to_s)
      end
    end
  end
end
