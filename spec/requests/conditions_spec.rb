require 'rails_helper'

RSpec.describe 'Conditions', type: :request do

  let!(:user) { create(:user) }
  let!(:condition) { create(:condition, user: user) }

  before do
    sign_in user
  end
  
  describe 'GET /conditions' do
    it '200ステータスが返ってくる' do
      get conditions_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /conditions' do
    context 'ログインしている場合' do

      it 'conditionを保存できる' do
        condition_params = attributes_for(:condition)
        post conditions_path({condition: condition_params})
        expect(response).to have_http_status(:success)
        expect(Condition.last.dates).to eq(condition_params[:dates])
        expect(Condition.last.mental).to eq(condition_params[:mental])
        expect(Condition.last.temperature).to eq(condition_params[:temperature])
      end

    end
  end
end
