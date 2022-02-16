require 'rails_helper'

RSpec.describe 'Condition', type: :system do
  let!(:user) { create(:user) }
  let!(:condition) { create(:condition, user: user) }

  describe 'Login' do
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

  describe 'root_pathからの動作確認' do
    before do
      sign_in user
    end

    context 'これまでのコンディションをクリックした場合' do
      it 'conditionが表示される' do
        visit root_path
        find('.sub').click
        expect(page).to have_css('.condition', text: condition.dates)
        expect(page).to have_css('.condition', text: condition.mental)
        expect(page).to have_css('.condition', text: condition.sleep_start.strftime( "%H:%M" ))
        expect(page).to have_css('.condition', text: condition.sleep_end.strftime( "%H:%M" ))
        expect(page).to have_css('.condition', text: condition.temperature)
      end
    end

    context '.condition_linkをクリックした場合' do
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

    context 'コンディションを入力するをクリックした場合' do
      it 'conditions/newページに遷移する' do
        visit root_path
        click_on 'コンディションを入力する'
        expect(page).to have_content '日付'
        expect(page).to have_content '気分'
        expect(page).to have_content '体重'
      end
    end
  end
end