class AddEmployeeRemovalDate < ActiveRecord::Migration
  def change
    add_column(:employees, :removal_date, :date)
  end
end
