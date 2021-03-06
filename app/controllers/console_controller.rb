class ConsoleController < ApplicationController
  def index
    if !current_employee
      redirect_to root_path
    else
      @departments = Department.where(organization_id: current_employee.organization_id)
      @employees = Employee.where(department_id: current_employee.department_id)
    end
  end
end
