class AddOmniauthToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :omniauth, :boolean
  end
end
