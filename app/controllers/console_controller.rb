class ConsoleController < ApplicationController
  def index
    @departments = Department.where(organization_id: current_employee.organization_id)
    @employees = Employee.where(department_id: current_employee.department_id)
  end
end
