class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :food
  has_many :foods, foreign_key: 'recipe_id'
end
