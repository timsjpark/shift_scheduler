FactoryGirl.define do
  factory :employee do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    employee_number "1"
    password { Faker::Internet.password}
    password_confirmation { password }
    organization_id { Faker::Number.between(1, 5)}
    department_id { Faker::Number.between(1, 30)}
  end

end
