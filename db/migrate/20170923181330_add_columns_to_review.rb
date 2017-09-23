class AddColumnsToReview < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :reviewer_id, :integer
    add_column :reviews, :reviewee_id, :integer
    add_column :reviews, :rating, :integer
    add_column :reviews, :description, :string
    add_column :reviews, :transaction_id, :integer
  end
end
