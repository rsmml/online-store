class AddColumnsToTableClients < ActiveRecord::Migration[6.0]
  def change
    add_column :clients, :name, :string
    add_column :clients, :last_name, :string
    add_column :clients, :address, :string
  end
end
