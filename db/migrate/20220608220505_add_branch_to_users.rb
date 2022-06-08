class AddBranchToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :branch, null: false, foreign_key: true
  end
end
