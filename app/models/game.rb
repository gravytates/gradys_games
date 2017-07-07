class Game < ApplicationRecord
  validates :name, :description, :price, :image, :genre, :platform, presence: true

  has_many :reviews
  has_many :users, through: :reviews
end
