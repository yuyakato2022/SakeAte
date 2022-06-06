class Alcohol < ApplicationRecord
  has_many :review, dependent: :destroy
end
