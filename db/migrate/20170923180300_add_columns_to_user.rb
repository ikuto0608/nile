class AddColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :instragram_url, :string
    add_column :users, :pintrest_url, :string
    add_column :users, :tag_line, :string
    add_column :users, :full_name, :string
    add_column :users, :email, :string
    add_column :users, :password, :string
  end
end
