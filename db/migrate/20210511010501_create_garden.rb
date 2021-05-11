class CreateGarden < ActiveRecord::Migration[5.2]
  def change
    create_table :gardens do |t|
      t.string :name
      t.boolean :water_on
      t.integer :water_access_pts
      t.timestamps
    end
  end
end
