class Recipe < ApplicationRecord
	
	has_many :recipe_genre, dependent: :destroy
	has_many :alcohol, through: :recipe_genre, dependent: :destroy

	has_many :bookmark, dependent: :destroy
	has_many :user, through: :bookmark, dependent: :destroy

	has_many :review, dependent: :destroy

	has_one_attached :image

	def get_image(width, height)
	  unless image.attached?
	    file_path = Rails.root.join('app/assets/images/no_image.jpg')
	    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
	  end
	    image.variant(resize_to_limit: [width, height]).processed
	end

end
