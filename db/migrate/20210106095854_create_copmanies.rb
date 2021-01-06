class CreateCopmanies < ActiveRecord::Migration[6.0]
  def change
    create_table :copmanies do |t|
      t.references :users, null: false, foreign_key: true
      t.references :stores, null: false, foreign_key: true

      t.timestamps
    end
  end
end
