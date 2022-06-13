class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :bookmarks, dependent: :destroy

  has_many :reviews, dependent: :destroy

  has_one_attached :profile_image

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = 'ゲスト'
    end
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
