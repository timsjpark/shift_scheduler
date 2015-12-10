class SchedulesController < ApplicationController
  load_and_authorize_resource

  before_action :set_employee, only: [:show, :email_schedule]

  def show
    @shifts = Shift.where(schedule_id: params[:id])

    respond_to do |format|
      format.html { render :show }
      format.json { render json: {'success': 1, 'result': serialized_schedule} }
    end
  end

  def serialized_schedule
    ActiveModel::ArraySerializer.new(@shifts).as_json
  end

  def email_schedule
    EmployeeNotifier.send_schedule(@employee).deliver_now
    redirect_to employees_path, notice: 'Email was successfully sent'
  end

  private
  def set_employee
    @employee = Employee.find(params[:id])
  end
end
