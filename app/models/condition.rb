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
class Condition < ApplicationRecord
  enum mental:{great:1, good:2, soso:3, bad:3}

  validates :dates, presence: true, uniqueness: { scope: :user }

  belongs_to :user

  def to_param
    dates
  end
end
