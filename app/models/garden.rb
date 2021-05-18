class Garden < ApplicationRecord
  has_many :plots, dependent: :destroy

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

  def self.by_plot_count
    self.all.sort_by { |garden| garden.plot_count }.reverse
  end
end
