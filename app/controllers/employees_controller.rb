class EmployeesController < ApplicationController
  load_and_authorize_resource

  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)

    if Employee.count == 0
      @employee.type = 'Manager'
    end

    respond_to do |format|
      if @employee.save
        if current_employee
          # If employee is logged in, notice should say you added employees to table
          format.html { redirect_to @employee,
                                    notice: "#{@employee.first_name.capitalize} #{@employee.last_name.capitalize} was added on #{Time.new.strftime('%m/%d/%Y')}"
          }
        elsif @employee.type == 'Manager'
          # If employee is not logged in, notice should say you just signed up
          session[:id] = @employee.id
          format.html { redirect_to @employee,
                                    notice: "Thank you for signing up #{@employee.first_name.capitalize} #{@employee.last_name.capitalize}. You have just been assigned as a manager."
          }
        else
          # If employee is not logged in, notice should say you just signed up
          session[:id] = @employee.id
          format.html { redirect_to @employee,
                                    notice: "Thank you for signing up #{@employee.first_name.capitalize} #{@employee.last_name.capitalize}"
          }
        end
        format.json { render :show, status: :created, location: @employee }
        @employee.schedule = Schedule.new
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
                                       :employee_number, :password, :password_confirmation)
    end
  end
end
