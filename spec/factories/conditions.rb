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
FactoryBot.define do
  factory :condition do
    dates { Date.today+1 }
    mental { 'good' }
    sleep_start { DateTime.now }
    sleep_end { DateTime.now }
    temperature  { 36.5 }
  end
end
