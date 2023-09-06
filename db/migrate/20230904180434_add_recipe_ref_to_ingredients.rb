class AddRecipeRefToIngredients < ActiveRecord::Migration[7.0]
  def change
    add_reference :ingredients, :recipe, null: false, foreign_key: true
  end
end
