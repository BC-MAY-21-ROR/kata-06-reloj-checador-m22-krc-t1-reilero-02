class RemoveEmployeeIdFromEmployees < ActiveRecord::Migration[7.0]
  def change
    remove_column :employees, :employee_id, :integer
  end
end
