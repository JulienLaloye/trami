class CreateReports < ActiveRecord::Migration[7.1]
  def change
    create_table :reports do |t|
      t.integer :reporter
      t.integer :reportee
      t.string :reason
      t.boolean :status

      t.timestamps
    end
  end
end
