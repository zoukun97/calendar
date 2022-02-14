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
require "test_helper"

class ConditionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
