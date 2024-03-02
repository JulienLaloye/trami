class AddReferencesToReport < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :reports, :users, column: :reporter
    add_foreign_key :reports, :users, column: :reportee
  end
end
