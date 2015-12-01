class SessionsController < ApplicationController
  def login
  end

  def create
    employee = Employee.find_by_email(params[:email])
    if employee && employee.authenticate(params[:password])
      session[:id] = employee.id
      redirect_to root_path,
        notice: "Welcome back #{employee.first_name.capitalize}"
    else
      flash[:error] = 'Invalid email or password'
      render :login
    end
  end

  def destroy
    if employee = current_employee
      session[:id] = nil
      redirect_to root_path,
        notice: "#{employee.email} has been logged out"

    end
  end
end
