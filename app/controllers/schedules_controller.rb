class SchedulesController < ApplicationController
  load_and_authorize_resource


  def show
    @employee = Employee.find(params[:id])
    @shifts = Shift.where(schedule_id: params[:id])

    respond_to do |format|
      format.html { render :show }
      format.json { render json: {'success': 1, 'result': serialized_schedule} }
    end
  end

  def serialized_schedule
    ActiveModel::ArraySerializer.new(@shifts).as_json
  end

end
