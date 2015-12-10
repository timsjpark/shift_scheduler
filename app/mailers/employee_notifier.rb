class EmployeeNotifier < ApplicationMailer
  include SendGrid
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

  def send_schedule(employee)
    @employee = employee
    mail to: @employee.email
  end
end
