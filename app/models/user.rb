class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :bookmark, dependent: :destroy
  has_many :recipe, through: :bookmark, dependent: :destroy
  
  has_many :review, dependent: :destroy
  has_many :recipe, through: :rebview, dependent: :destroy
   
  has_one_attached :profile_image

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
