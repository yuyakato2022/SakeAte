class Recipe < ApplicationRecord

	has_many :recipe_genres, dependent: :destroy
	has_many :alcohols, through: :recipe_genres, dependent: :destroy
	has_many :bookmarks, dependent: :destroy
	has_many :reviews, dependent: :destroy

	has_one_attached :image

	validates :image, presence: true                  #画像
	validates :name, length: { in: 2..30 }            #レシピ名
	validates :recipe_genres, presence: true          #お酒の選択
	validates :explanation, length: { in: 1..100 }    #コメント
	validates :ingredient, length: { maximum: 1000 }  #食材
	validates :procedure, length: { maximum: 2500 }   #手順

	# 新着順・ランキング順
	scope :latest, -> {order(created_at: :desc)}
	scope :star_count, -> {left_joins(:reviews).group(:id).order("avg(reviews.rate) DESC")}
	#ランキング平均値の記述 BigDecimalから整数少数へ変換
	def reviews_avg
		reviews.average(:rate).to_s.to_f.round(1)
	end

	def get_image(width, height)
	  unless image.attached?
	    file_path = Rails.root.join('app/assets/images/no_image.jpg')
	    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
	  end
	  image.variant(resize_to_limit: [width, height]).processed
	end
	#bookmarkテーブルにユーザーidが存在しているかを検証
  def bookmarked_by?(user)
    bookmarks.exists?(user_id: user.id)
  end

end