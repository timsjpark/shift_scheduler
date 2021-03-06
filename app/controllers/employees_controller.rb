class EmployeesController < ApplicationController
  load_and_authorize_resource

  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.where(department_id: current_employee.department_id)
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
    @departments = Department.where(organization_id: current_employee.organization_id) if current_employee
  end

  # GET /employees/1/edit
  def edit
    @departments = Department.where(organization_id: current_employee.organization_id) if current_employee
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)

    if current_employee
      @employee.organization_id = current_employee.organization_id
    end

    respond_to do |format|
      if @employee.save
        if current_employee
          # If employee is logged in, notice should say you added employees to table
          format.html { redirect_to @employee,
                                    notice: "#{@employee.first_name.capitalize} #{@employee.last_name.capitalize} was added on #{Time.new.strftime('%m/%d/%Y')}"
          }
        else
          # If employee is not logged in, notice should say you just signed up
          session[:id] = @employee.id
          format.html { redirect_to organizations_path,
                                    notice: "Thank you for signing up #{@employee.first_name.capitalize} #{@employee.last_name.capitalize}"
          }
        end
        format.json { render :show, status: :created, location: @employee }
        @employee.schedule = Schedule.create(department_id: @employee.department_id)
        # Possibly move to after_save, if email changes, set needs_verification
        @employee.needs_verification!
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee,
                                  notice: "#{@employee.first_name} #{@employee.last_name} was updated"
        }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.update_attribute(:removal_date, Date.today)
    respond_to do |format|
      format.html { redirect_to employees_url,
                                notice: "#{@employee.first_name} #{@employee.last_name} was removed."
      }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_employee
    @employee = Employee.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def employee_params
    if params[:employee]
      params.require(:employee).permit(:first_name, :last_name, :email,
        :employee_number, :password, :password_confirmation,
        :type, :omniauth, :department_id, :organization_id)
    elsif params[:manager]
      params.require(:manager).permit(:first_name, :last_name, :email,
        :employee_number, :password, :password_confirmation,
        :type, :omniauth, :department_id, :organization_id)
    end
  end
end
