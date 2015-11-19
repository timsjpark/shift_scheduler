class Employee < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :email
  validates :email, format: { with: /\A\w+@\w+\.\w+\z/ }
end
