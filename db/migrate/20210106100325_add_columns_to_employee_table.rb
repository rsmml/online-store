class AddColumnsToEmployeeTable < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :name, :string
    add_column :employees, :role, :string
  end
end
