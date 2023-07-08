class CreateOrchestra < ActiveRecord::Migration[7.0]
  def change
    create_table :orchestras do |t|
      t.string :name
      t.integer :chairs
      t.string :conductor
      t.boolean :active
      t.boolean :venue

      t.timestamps
    end
  end
end
