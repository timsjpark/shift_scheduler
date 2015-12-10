class AddOrganizationToEmployees < ActiveRecord::Migration
  def change
    add_reference :employees, :organization, index: true, foreign_key: true
  end
end
