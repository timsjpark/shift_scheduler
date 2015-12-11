rand_number = rand(-10..10)

time_1 = Faker::Time.between(Time.now + rand_number, Time.now)
time_2 = Faker::Time.between(Time.now + (rand_number) + (6/24), Time.now)

FactoryGirl.define do
  factory :shift do
    shift_description "My Shift"
    start_time { time_1 }
    end_time { time_2 }
    schedule_id { Faker::Number.between(1, 25) }
  end

end
