class Plot < ApplicationRecord
  belongs_to :garden

  def available_text
    return "Yes" if available
    "No"
  end

  def sun_coverage_text
    sun_coverage.split('_').map {|w| w.capitalize}.join(' ')
  end
end
