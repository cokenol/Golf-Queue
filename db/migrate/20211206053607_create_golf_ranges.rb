class CreateGolfRanges < ActiveRecord::Migration[6.1]
  def change
    create_table :golf_ranges do |t|
      t.string :name
      t.text :address
      t.string :weather

      t.timestamps
    end
  end
end
