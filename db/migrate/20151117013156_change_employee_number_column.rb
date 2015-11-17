class ChangeEmployeeNumberColumn < ActiveRecord::Migration
  def change
    change_column(:employees, :employee_number, :string)
  end
end
