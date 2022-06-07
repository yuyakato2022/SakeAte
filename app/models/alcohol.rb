class Alcohol < ApplicationRecord
  has_many :recipe_genre, dependent: :destroy
  has_many :recipe, through: :recipe_genre, dependent: :destroy
end
