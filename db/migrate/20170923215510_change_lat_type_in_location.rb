class ChangeLatTypeInLocation < ActiveRecord::Migration[5.0]
  def change
    change_column :locations, :lat, :decimal
  end
end
