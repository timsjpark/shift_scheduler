# Preview all emails at http://localhost:3000/rails/mailers/employee_notifier
class EmployeeNotifierPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/employee_notifier/signed_up
  def signed_up
    EmployeeNotifier.signed_up
  end

  # Preview this email at http://localhost:3000/rails/mailers/employee_notifier/verified
  def verified
    EmployeeNotifier.verified
  end

  # Preview this email at http://localhost:3000/rails/mailers/employee_notifier/verify
  def verify
    EmployeeNotifier.verify
  end

end
