class Shift < ActiveRecord::Base
  belongs_to :schedule
  has_one :employee, through: :schedule
end
