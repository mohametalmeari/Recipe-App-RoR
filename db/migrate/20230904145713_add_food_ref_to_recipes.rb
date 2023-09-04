class AddFoodRefToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_reference :recipes, :food, null: false, foreign_key: true
  end
end
