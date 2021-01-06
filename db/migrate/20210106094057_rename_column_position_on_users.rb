class RenameColumnPositionOnUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :position, :role
  end
end
