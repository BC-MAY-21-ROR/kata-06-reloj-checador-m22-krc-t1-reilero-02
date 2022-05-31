class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :Name
      t.string :Email
      t.string :Position
      t.primary_key :id
      t.integer :Private_number

      t.timestamps
    end
  end
end
