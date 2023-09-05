class IngredientsController < ApplicationController
  def new
    @foods = Food.all.order(created_at: :desc)
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = Ingredient.new
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    flash[:notice] = if @ingredient.save
                       'Ingredient created!'
                     else
                       @group.errors.full_messages.join(', ')
                     end
    redirect_to request.referrer
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy
    redirect_to request.referrer
  end

  def update
    @ingredient = Ingredient.find(params[:id])

    if @ingredient.update(quantity_param)
      flash[:notice] = 'Ingredient updated!'
      redirect_to recipe_path(params[:recipe_id])
    else
      flash[:notice] = @ingredient.errors.full_messages.join(', ')
      redirect_to request.referrer
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:food_id, :recipe_id, :quantity)
  end

  def quantity_param
    params.require(:ingredient).permit(:quantity)
  end
end
