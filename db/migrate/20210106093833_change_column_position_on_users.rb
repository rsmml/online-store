class ChangeColumnPositionOnUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :position, :string, :default => 'client'
  end
end
