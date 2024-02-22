class CreateAvatars < ActiveRecord::Migration[7.1]
  def change
    create_table :avatars do |t|
      t.string :personality
      t.string :picture
      t.string :description

      t.timestamps
    end
  end
end
