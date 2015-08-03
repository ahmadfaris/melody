class AddIndexToDrink < ActiveRecord::Migration
  def change
    add_column :drinks, :restaurant_id, :integer
  end
end
