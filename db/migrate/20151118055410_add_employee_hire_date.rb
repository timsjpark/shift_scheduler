class AddEmployeeHireDate < ActiveRecord::Migration
  def change
    add_column(:employees, :hire_date, :date, default: Date.today)
  end
end
