class RenameWorkPlaceToCompany < ActiveRecord::Migration[6.0]
  def change
    rename_table :work_places, :companies
  end
end
