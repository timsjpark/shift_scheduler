class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_employee
  helper_method :current_department

  # Set the time zone so the default time for scheduling shifts is set to the
  # current hour and minute of the local time zone
  before_filter :set_timezone

  def set_timezone
    Time.zone = 'Mountain Time (US & Canada)'
  end

  # change the default cancancan method to account for employee vs. user model
  def current_ability
    @current_ability ||= Ability.new(current_employee)
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:danger] = exception.message
    redirect_to root_url
  end

  private

  def current_employee
    @logged_in_employee ||= Employee.find(session[:id]) if session[:id]
  rescue ActiveRecord::RecordNotFound
    session.delete(:id)
    nil
  end

  def current_department
    @current_department = current_employee.department
    # @current_department = Department.where(organization_id: current_employee.organization_id)
  end
end
