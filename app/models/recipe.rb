class Recipe < ApplicationRecord
  belongsto :user
	has_many :recipe_genre, dependent: :destroy
	has_many :bookmark, dependent: :destroy
	has_many :review, dependent: :destroy
	has_many :recipe_genre, dependent: :destroy
	has_one_attached :profile_image

end
