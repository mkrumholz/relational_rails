class Garden < ApplicationRecord
  has_many :plots

  def water_on_text
    return "Yes" if water_on
    "No"
  end

  def plot_count
    plots.count
  end

  def plots_by_name
    plots.order(Arel.sql('lower(name)'))
  end
end
