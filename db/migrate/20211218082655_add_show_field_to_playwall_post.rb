class AddShowFieldToPlaywallPost < ActiveRecord::Migration[6.1]
  def change
    add_column :playwall_posts, :display, :boolean, default: true
  end
end
