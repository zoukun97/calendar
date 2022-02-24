class DateJob < ApplicationJob
  def perform
    User.all.each do |user|
      user.conditions.create(dates: Date.today)
    end
  end
end