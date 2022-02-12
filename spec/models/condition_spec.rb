require 'rails_helper'

RSpec.describe Condition, type: :model do
  context 'dates,mental,sleep_start,sleep_end,temperatureが入力されている場合' do
    let(:user) do
      User.create!({
        email: 'test@example.com',
        password: 'password'
      })
    end
      
    let(:condition) do
      user.conditions.build({
        dates: Date.today,
        mental: 'good',
        sleep_start: DateTime.now,
        sleep_end: DateTime.now,
        temperature: 36.5
      })
    end
      
    it '記事を保存できる' do
      expect(condition).to be_valid
    end
  end
end
