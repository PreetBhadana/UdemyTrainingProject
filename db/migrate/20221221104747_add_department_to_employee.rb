class AddDepartmentToEmployee < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :employees, :departments
    add_column :employees, :salary, :integer
  end
end
