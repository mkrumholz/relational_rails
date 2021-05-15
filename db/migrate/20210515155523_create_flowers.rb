class CreateFlowers < ActiveRecord::Migration[5.2]
  def change
    create_table :flowers do |t|
      t.string :species
      t.integer :shelf_life
      t.boolean :in_stock
      t.timestamps
    end
  end
end
