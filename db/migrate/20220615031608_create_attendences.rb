class CreateAttendences < ActiveRecord::Migration[7.0]
  def change
    create_table :attendences do |t|
      t.string :employee_private_number
      t.datetime :check_in
      t.datetime :check_out
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
