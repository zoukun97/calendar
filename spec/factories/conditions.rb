FactoryBot.define do
  factory :condition do
    dates { Date.today }
    mental { 'good' }
    sleep_start { DateTime.now }
    sleep_end { DateTime.now }
    temperature  { 36.5 }
  end
end