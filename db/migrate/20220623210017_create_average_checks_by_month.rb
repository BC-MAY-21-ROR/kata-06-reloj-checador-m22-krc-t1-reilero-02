class CreateAverageChecksByMonth < ActiveRecord::Migration[7.0]
  def change
    create_table :average_checks_by_months do |t|
      t.string :month
      t.datetime :avg_check_in
      t.datetime :avg_check_out
      t.integer :n_check_ins
      t.integer :n_check_outs
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
