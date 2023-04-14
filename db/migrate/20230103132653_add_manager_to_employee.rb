class AddManagerToEmployee < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :manager_id, :integer, foreign_key: true
  end
end
