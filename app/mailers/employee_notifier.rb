class EmployeeNotifier < ApplicationMailer

  def signed_up(employee)
    @employee = employee
    mail to: @employee.email
  end

  def verified(employee)
    @employee = employee
    mail to: @employee.email
  end

  def verify(employee)
    @employee = employee
    mail to: @employee.email
  end
end
