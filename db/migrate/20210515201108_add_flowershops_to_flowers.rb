class AddFlowershopsToFlowers < ActiveRecord::Migration[5.2]
  def change
    add_reference :flowers, :flower_shop, foreign_key: true
  end
end
