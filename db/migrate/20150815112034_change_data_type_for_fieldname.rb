class ChangeDataTypeForFieldname < ActiveRecord::Migration
    def self.up
    change_column :restaurants, :lng, :float
  end
 
  def self.down
    change_column :restaurants, :lng, :decimal
  end
end
