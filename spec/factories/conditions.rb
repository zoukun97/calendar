# == Schema Information
#
# Table name: conditions
#
#  id          :bigint           not null, primary key
#  dates       :date             not null
#  exercise    :text
#  food        :text
#  mental      :integer          not null
#  sleep_end   :datetime         not null
#  sleep_start :datetime         not null
#  temperature :float            not null
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
    dates { Date.today }
    mental { 'good' }
    sleep_start { DateTime.now }
    sleep_end { DateTime.now }
    temperature  { 36.5 }
  end
end
