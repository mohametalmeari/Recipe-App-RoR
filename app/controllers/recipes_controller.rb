class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.order(created_at: :desc)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      flash[:notice] = 'New Recipe is added to the list!'
      redirect_to recipes_path
    else
      flash[:notice] = @recipe.errors.full_messages.join(', ')
      redirect_to request.referrer
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :prepration_time, :cooking_time, :description, :public)
  end
end
