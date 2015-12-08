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

  def oauth
    @employee = Employee.where(
        email: omniauth_options[:email]
    ).first_or_initialize(omniauth_options)

    if @employee.persisted?
      session[:id] = @employee.id
      redirect_to root_path,
          notice: "Logged in as #{@employee.first_name.titleize}."
    else
      render 'employees/new'
    end
  end

  def destroy
    if employee = current_employee
      session[:id] = nil
      redirect_to root_path,
        notice: "#{employee.email} has been logged out"

    end
  end

  private
  def omniauth_options
    if auth_hash = request.env['omniauth.auth']
      first_name, last_name = auth_hash[:info][:name].split(/\s+/, 2)
      {
          email: auth_hash[:info][:email],
          first_name: first_name,
          last_name: last_name,
          omniauth: true
      }
    end
  end

  def token_options
    auth_hash = request.env['omniauth.auth']['credentials']
      {
          access_token: auth_hash['token'],
          refresh_token: auth_hash['refresh_token'],
          expires_at: Time.at(auth_hash['expires_at']).to_datetime,
          email: @employee.email
      }
  end
end
