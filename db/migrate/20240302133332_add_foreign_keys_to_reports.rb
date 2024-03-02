class AddForeignKeysToReports < ActiveRecord::Migration[7.1]
  def change
    rename_column :reports, :reportee, :reportee_id
    rename_column :reports, :reporter, :reporter_id
    add_foreign_key :reports, :users, column: :reporter_id
    add_foreign_key :reports, :users, column: :reportee_id
  end
end
