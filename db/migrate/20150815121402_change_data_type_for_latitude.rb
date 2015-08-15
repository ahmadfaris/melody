class ChangeDataTypeForLatitude < ActiveRecord::Migration
  def self.up
    change_column :restaurants, :lat, :float
  end
 
  def self.down
    change_column :restaurants, :lat, :decimal
  end

end
