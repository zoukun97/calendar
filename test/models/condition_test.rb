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
#
require "test_helper"

class ConditionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
