class EmployeeNotifier < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.employee_notifier.signed_up.subject
  #
  def signed_up
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.employee_notifier.verified.subject
  #
  def verified
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.employee_notifier.verify.subject
  #
  def verify
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
