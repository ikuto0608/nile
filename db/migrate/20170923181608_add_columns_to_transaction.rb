class AddColumnsToTransaction < ActiveRecord::Migration[5.0]
  def change
    add_column :transactions, :buyer_id, :integer
    add_column :transactions, :seller_id, :integer
    add_column :transactions, :description, :string
    add_column :transactions, :price, :decimal
    add_column :transactions, :status, :string
  end
end
