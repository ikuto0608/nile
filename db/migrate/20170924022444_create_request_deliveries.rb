class CreateRequestDeliveries < ActiveRecord::Migration[5.0]
  def change
    create_table :request_deliveries do |t|
      t.string :product
      t.decimal :price
      t.text :message
      t.integer :customer_id
      t.integer :deliver_id
      t.integer :wishlist_id

      t.timestamps
    end
  end
end
