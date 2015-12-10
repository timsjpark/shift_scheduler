class DepartmentsController < ApplicationController

  load_and_authorize_resource

  before_action :set_department, only: [:show, :edit, :update, :destroy, :switch]
  def new
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)
    @department.organization_id = current_employee.organization_id

    respond_to do |format|
      if @department.save
        current_employee.department_id = @department.id
        current_employee.save

        format.html { redirect_to employees_path, notice: 'Department was successfully created.' }
        format.json { render :show, status: :created, location: @department }
      else
        format.html { render :new }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @departments = Department.where(organization_id: current_employee.organization_id)
  end

  def switch
    current_employee.department_id = @department.id
    current_employee.save
    schedule = current_employee.schedule
    schedule.department_id = @department.id
    schedule.save
    if current_employee.manager?
      redirect_to employees_path
    else
      redirect_to schedule_path
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @department.update(department_params)
        format.html { redirect_to departments_path,
          notice: "#{@department.name} was updated"
        }
        format.json { render :show, status: :ok, location: @department }
      else
        format.html { render :edit }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # def destroy
  #   @department.update_attribute(:removal_date, Date.today)
  #   respond_to do |format|
  #     format.html { redirect_to employees_url,
  #       notice: "#{@department.name} was removed."
  #     }
  #     format.json { head :no_content }
  #   end
  # end

  private

  def set_department
    @department = Department.find(params[:id])
  end

  def department_params
    params.require(:department).permit(:name)
  end

end

