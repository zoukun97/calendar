require 'rails_helper'

RSpec.describe 'Condition', type: :system do
  let!(:user) { create(:user) }
  let!(:condition) { create(:condition, user: user) }

  context 'ログインした場合' do
    it 'ホームページを表示する' do
      visit root_path
      fill_in 'Eメール', with: 'test@example.com'
      fill_in 'パスワード', with: 'password'
      click_on 'Log in'
      expect(page).to have_content 'ログインしました'
      expect(page).to have_content 'コンディションを入力しよう！'
    end
  end
end