class ChangeEmployeesToUsers < ActiveRecord::Migration[7.0]
  def change
    rename_table :employees, :users
  end
end
