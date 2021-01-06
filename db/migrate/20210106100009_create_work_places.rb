class CreateWorkPlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :work_places do |t|
      t.references :stores, null: false, foreign_key: true
      t.references :employees, null: false, foreign_key: true

      t.timestamps
    end
  end
end
