class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :bookmarks, dependent: :destroy

  has_many :reviews, dependent: :destroy

  has_one_attached :profile_image

  def get_profile_image(width, height)
	  unless profile_image.attached?
	    file_path = Rails.root.join('app/assets/images/no_image.jpg')
	    profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
	  end
	  profile_image.variant(resize_to_limit: [width, height]).processed
	end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = 'ゲスト'
    end
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
