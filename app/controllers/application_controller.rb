class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_employee

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
    @employee ||= Employee.find(session[:id]) if session[:id]
  end
end
