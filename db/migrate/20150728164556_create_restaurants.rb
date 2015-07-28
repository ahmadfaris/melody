class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :category
      t.decimal :lat
      t.decimal :lng

      t.timestamps null: false
    end
  end
end
