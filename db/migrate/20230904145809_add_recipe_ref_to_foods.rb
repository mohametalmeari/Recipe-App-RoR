class AddRecipeRefToFoods < ActiveRecord::Migration[7.0]
  def change
    add_reference :foods, :recipe, null: false, foreign_key: true
  end
end
