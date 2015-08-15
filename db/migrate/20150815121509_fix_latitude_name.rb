class FixLatitudeName < ActiveRecord::Migration
  def change
    rename_column :restaurants, :lat, :latitude
  end
end
