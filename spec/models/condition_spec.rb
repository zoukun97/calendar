require 'rails_helper'

RSpec.describe Condition, type: :model do
  context 'dates,mental,sleep_start,sleep_end,temperatureが入力されている場合' do
    let!(:user) { create(:user) }

    let!(:condition) { build(:condition, user: user) }

    it '記事を保存できる' do
      expect(condition).to be_valid
    end
  end
end
