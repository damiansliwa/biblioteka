class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :author
      t.string :ISBN
      t.integer :item_type, :default => 0

      t.timestamps
    end
  end
end
