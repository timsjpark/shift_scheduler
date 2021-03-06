class Schedule < ActiveRecord::Base
  belongs_to :employee
  has_many :shifts

  def employee_name
    employee = Employee.find_by_id(employee_id)
    "#{employee.first_name} #{employee.last_name}"
  end
end
