class ChangeLongTypeInLocation < ActiveRecord::Migration[5.0]
  def change
    change_column :locations, :long, :decimal
  end
end
