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

  context 'これまでのコンディションをクリックした場合' do
    before do
      sign_in user
    end

    it 'conditionが表示される' do
      visit root_path
      find('.home_subtitle').click
      expect(page).to have_css('.condition', text: condition.dates)
      expect(page).to have_css('.condition', text: condition.mental)
      expect(page).to have_css('.condition', text: condition.sleep_start.strftime( "%H:%M" ))
      expect(page).to have_css('.condition', text: condition.sleep_end.strftime( "%H:%M" ))
      expect(page).to have_css('.condition', text: condition.temperature)
    end
  end

  context '.condition_linkをクリックした場合' do
    before do
      sign_in user
    end

    it '日付詳細に遷移する' do
      visit root_path
      find('.home_subtitle').click
      click_on condition.dates
      expect(page).to have_css('.body_header', text: condition.dates)
      expect(page).to have_css('.section', text: condition.mental)
      expect(page).to have_css('.section', text: condition.sleep_start.strftime( "%H:%M" ))
      expect(page).to have_css('.section', text: condition.sleep_end.strftime( "%H:%M" ))
      expect(page).to have_css('.section', text: condition.temperature)
    end
  end
end