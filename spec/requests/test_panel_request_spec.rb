require 'rails_helper'

describe 'Requesting a test panel', type: :request do
  context 'with a valid test panel ID' do
    let(:test_panel_id) { 'TP1' }
    
    it 'should respond with an HTTP 200 status' do
      get '/test_panels/show', params: { id: test_panel_id }
      expect(response.status).to eq 200
    end
  end
end
