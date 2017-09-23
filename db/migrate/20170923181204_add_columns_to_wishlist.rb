class AddColumnsToWishlist < ActiveRecord::Migration[5.0]
  def change
    add_column :wishlists, :user_id, :integer
    add_column :wishlists, :description, :text
    add_column :wishlists, :location_id, :integer
    add_column :wishlists, :due_date, :datetime
  end
end
