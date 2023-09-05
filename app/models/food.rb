class Food < ApplicationRecord
  belongs_to :user
  has_many :ingredients

  def update_quantity
    total_quantity = ingredients.sum(&:quantity)
    update(quantity: total_quantity)
  end
end
