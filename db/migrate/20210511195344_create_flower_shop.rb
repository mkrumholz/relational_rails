class CreateFlowerShop < ActiveRecord::Migration[5.2]
  def change
    create_table :flower_shops do |t|
      t.string :name
      t.integer :rating
      t.boolean :same_day_delivery
      t.string :timestamps
    end
  end
end
