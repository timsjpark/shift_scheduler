class AddDepartmentToSchedules < ActiveRecord::Migration
  def change
    add_reference :schedules, :department, index: true, foreign_key: true
  end
end
