class Food < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  has_many :recipes, foreign_key: 'food_id'
end
