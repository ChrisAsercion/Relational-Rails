class CreateMusicians < ActiveRecord::Migration[7.0]
  def change
    create_table :musicians do |t|
      t.string :instruments
      t.integer :songs
      t.boolean :on_call
      t.references :orchestra, null: false, foreign_key: true

      t.timestamps
    end
  end
end
