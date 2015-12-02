class SchedulesController < ApplicationController
  def show
    @employee = Employee.find(params[:id])
    @shifts = Shift.where(schedule_id: params[:id])
  end

  def set_employee
    @employee = Employee.find(params[:id])
  end
end