class CreateRestaurantPizzas < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurant_pizzas do |t|
      t.integer :price
      t.belongs_to :pizza
      t.belongs_to :restaurant 

      t.timestamps
    end
  end
end
