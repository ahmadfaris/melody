class FixLongitudeName < ActiveRecord::Migration
  def change
    rename_column :restaurants, :lng, :longitude
  end
end
