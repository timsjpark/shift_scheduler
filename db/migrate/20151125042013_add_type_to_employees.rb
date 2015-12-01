class AddTypeToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :type, :string, default: 'Employee'
  end
end
