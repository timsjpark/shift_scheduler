class Department < ActiveRecord::Base
  belongs_to :organization
  has_many :employees
  has_many :schedules
  has_many :shifts, through: :schedules
end
