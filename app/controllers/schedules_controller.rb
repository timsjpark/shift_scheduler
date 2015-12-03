class SchedulesController < ApplicationController
  load_and_authorize_resource

  def show
    @employee = Employee.find(params[:id])
    @shifts = Shift.where(schedule_id: params[:id])
  end
end