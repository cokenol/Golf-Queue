class CreatePlaywallPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :playwall_posts do |t|
      t.references :user, null: false, foreign_key: true
      t.text :caption
      t.references :golf_range, null: false, foreign_key: true

      t.timestamps
    end
  end
end
