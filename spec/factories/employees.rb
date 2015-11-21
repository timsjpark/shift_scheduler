FactoryGirl.define do
  factory :employee do
    first_name "MyString"
    last_name "MyString"
    email "MyString@email.com"
    employee_number 1
    password 'password'
    password_confirmation 'password'
  end

end
