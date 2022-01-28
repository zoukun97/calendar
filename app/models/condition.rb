# == Schema Information
#
# Table name: conditions
#
#  id          :bigint           not null, primary key
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
class Condition < ApplicationRecord
  enum mental:{great:1, good:2, soso:3, bad:3}
    
end
