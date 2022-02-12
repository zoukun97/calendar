# == Schema Information
#
# Table name: levels
#
#  id         :bigint           not null, primary key
#  level      :integer
#  thresold   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Level < ApplicationRecord
end
