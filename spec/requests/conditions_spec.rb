require 'rails_helper'

RSpec.describe 'Conditions', type: :request do

  let!(:user) { create(:user) }
  let!(:conditions) { create_list(:condition, 3, user: user) }
  
  describe 'GET /conditions' do
    it '200ステータスが返ってくる' do
      get conditions_path
      expect(response).to have_http_status(200)
    end
  end
end
