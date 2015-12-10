class AddVerifiedEmailAndTokenToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :verified_email, :boolean
    add_column :employees, :token, :string
  end
end
