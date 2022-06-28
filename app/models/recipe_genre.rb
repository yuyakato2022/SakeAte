class RecipeGenre < ApplicationRecord

  belongs_to :recipe
	belongs_to :alcohol

end
