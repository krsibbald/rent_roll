FactoryBot.define do
  factory :stay do
    resident
    unit
  end

  trait :past do
    move_in { 2.months.ago }
    move_out { 1.month.ago }
  end

  trait :present do
    move_in { 1.week.ago }
    move_out { Date.today + 1.month }
  end

  trait :future do
    move_in { Date.today + 1.month }
    move_out { Date.today + 3.months}
  end
end
