# == Schema Information
#
# Table name: conditions
#
#  id          :bigint           not null, primary key
#  dates       :date             not null
#  exercise    :text
#  food        :text
#  mental      :integer
#  sleep_end   :datetime
#  sleep_start :datetime
#  temperature :float
#  weight      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#
# Indexes
#
#  index_conditions_on_user_id  (user_id)
#
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
