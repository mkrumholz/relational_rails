class Plot < ApplicationRecord
  belongs_to :garden

  def available_text
    return "Yes" if available
    "No"
  end

  def sun_coverage_text
    sun_coverage.split('_').map {|w| w.capitalize}.join(' ')
  end

  def garden_name
    garden.name
  end

  def self.sort_by_name
    order(Arel.sql('lower(name)'))
  end

  def self.larger_than(area)
    where("square_ft > #{area}")
  end
end
