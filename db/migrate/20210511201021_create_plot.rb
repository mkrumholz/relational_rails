class CreatePlot < ActiveRecord::Migration[5.2]
  def change
    create_table :plots do |t|
      t.string :name
      t.boolean :available
      t.string :sun_coverage
      t.integer :square_ft
      t.timestamps
    end
  end
end
