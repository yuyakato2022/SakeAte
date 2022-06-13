class Bookmark < ApplicationRecord

  belongs_to :user
  belongs_to :recipe
  #ロード中２度以上連続の登録を防ぐ
  validates :user_id, uniqueness: { scope: :recipe_id }

end
