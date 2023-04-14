class AddDepartmentIdToEmployees < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :department_id, :integer
  end
end
