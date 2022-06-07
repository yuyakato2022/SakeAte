class Recipe < ApplicationRecord
	has_many :recipe_genre, dependent: :destroy
	has_many :alcohol, through: :recipe_genre, dependent: :destroy
	
	has_many :bookmark, dependent: :destroy
	has_many :user, through: :bookmark, dependent: :destroy
	
	has_many :review
	has_many :user, through: :review, dependent: :destroy
	
	has_one_attached :image
end
