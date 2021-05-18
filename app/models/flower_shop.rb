class FlowerShop < ApplicationRecord
  has_many :flowers

  def flower_count
    flowers.count
  end

  def flowers_by_name
    flowers.order(Arel.sql('lower(species)'))
  end
end
