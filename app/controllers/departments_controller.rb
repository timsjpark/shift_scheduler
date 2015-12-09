class DepartmentsController < ApplicationController

  load_and_authorize_resource

  # before_action :set_department, only: [:show]
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

  def join
    @department = Department.find_by(params[:id])
    current_employee.department_id = @department.id
    redirect_to schedule_path
  end

  private

  # def set_department
  #   @department = Department.find(params[:id])
  # end

  def department_params
    params.require(:department).permit(:name)
  end

end

