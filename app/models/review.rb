class Review < ApplicationRecord

  belongs_to :user
	belongs_to :recipe
	validates :text, length: { in: 1..200 }

end
