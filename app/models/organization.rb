class Organization < ActiveRecord::Base
  has_many :departments
  has_many :employees, through: :departments
end