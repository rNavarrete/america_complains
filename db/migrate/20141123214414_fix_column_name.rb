class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :businesses, :lon, :lat
  end
end
