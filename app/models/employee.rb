class Employee < ActiveRecord::Base
  has_secure_password
  validates_presence_of :first_name, :last_name, :email
  validates :email, format: { with: /@/ }
end
