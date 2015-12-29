department_names = [
'Sanitation', 'Purchasing', 'Administration', 'Human Resources',
'Outreach', 'Finance', 'Recruiting', 'Technology', 'Management'
]

FactoryGirl.define do
  factory :department do
    name { department_names.sample }
    organization_id { Faker::Number.between(1, 5)}
  end

end
