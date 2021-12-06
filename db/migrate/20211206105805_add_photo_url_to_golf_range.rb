class AddPhotoUrlToGolfRange < ActiveRecord::Migration[6.1]
  def change
    add_column :golf_ranges, :photo_url, :string
  end
end
