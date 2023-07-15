class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false, limit: 255
      t.integer :price, null: false
      t.string :img, null: false, limit: 255
      t.string :description, null: false, limit: 255
      t.integer :stock, null: false, default: 0
      t.timestamps
    end
  end
end
