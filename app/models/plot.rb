class Plot < ApplicationRecord
  belongs_to :garden

  def available_text
    return "Yes" if available
    "No"
  end
end
