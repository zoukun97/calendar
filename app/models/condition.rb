# == Schema Information
#
# Table name: conditions
#
#  dates       :date             not null, primary key
#  exercise    :text
#  food        :text
#  mental      :integer          not null
#  sleep_end   :datetime         not null
#  sleep_start :datetime         not null
#  temperature :integer          not null
#  weight      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#
# Indexes
#
#  index_conditions_on_user_id  (user_id)
#
class Condition < ApplicationRecord
  enum mental:{great:1, good:2, soso:3, bad:3}

  validates :dates, presence: true, uniqueness: { scope: :user }
  validates :mental, presence: true
  validates :sleep_end, presence: true
  validates :sleep_start, presence: true
  validates :temperature, presence: true

  belongs_to :user
    
end
