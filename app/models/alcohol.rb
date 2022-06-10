class Alcohol < ApplicationRecord
  has_many :recipe_genres, dependent: :destroy
  has_many :recipes, through: :recipe_genres, dependent: :destroy
end
