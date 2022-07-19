class Review < ApplicationRecord

  belongs_to :user
	belongs_to :recipe

	validates :text, length: { in: 1..200 } #コメント
	validates :rate, presence: true         #星評価

end
