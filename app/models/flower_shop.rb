class FlowerShop < ApplicationRecord
  has_many :flowers

  def flower_count
    flowers.count
  end
end
