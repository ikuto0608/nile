class CreateBiddings < ActiveRecord::Migration[5.0]
  def change
    create_table :biddings do |t|
      t.decimal :price

      t.timestamps
    end

    add_reference :biddings, :user, index: true
    add_reference :biddings, :wishlist, index: true
  end
end
