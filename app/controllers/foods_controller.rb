class FoodsController < ApplicationController
  def index
    @foods = Food.all.order(created_at: :desc)
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user = current_user
    if @food.save
      flash[:notice] = 'New Food is added to the list!'
      redirect_to foods_path
    else
      flash[:notice] = @food.errors.full_messages.join(', ')
      redirect_to request.referrer
    end
  end
  
  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_path
  end
  
  private 
  
  def food_params
    params.require(:food).permit(:name, :measurment_unit, :price, :quantity)
  end
end