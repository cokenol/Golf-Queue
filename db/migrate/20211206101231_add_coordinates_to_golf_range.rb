class AddCoordinatesToGolfRange < ActiveRecord::Migration[6.1]
  def change
    add_column :golf_ranges, :latitude, :float
    add_column :golf_ranges, :longitude, :float
  end
end
