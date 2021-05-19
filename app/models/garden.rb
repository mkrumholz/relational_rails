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
    plots.sort_by_name
  end

  def self.by_plot_count
    left_outer_joins(:plots)
    .group('gardens.id')
    .order(Arel.sql("count(distinct plots.id) desc"))
  end

  def min_square_ft(area)
    plots.larger_than(area)
  end
end
