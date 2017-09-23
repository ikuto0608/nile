class AddColumnsToLocation < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :city_name, :string
    add_column :locations, :lat, :integer
    add_column :locations, :long, :integer
  end
end
