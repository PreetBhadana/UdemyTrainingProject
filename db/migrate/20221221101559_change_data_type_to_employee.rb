class ChangeDataTypeToEmployee < ActiveRecord::Migration[7.0]
  def change
    change_column :employees, :name, :string
  end
end
