class Game < ApplicationRecord
  validates :name, :description, :price, :image, :genre, :platform, presence: true

  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews

  scope :recent_creations, -> { order(created_at: :desc).limit(3) }
  scope :recent, -> { order(created_at: :desc) }
  scope :alphabetical, -> { order(name: :asc) }
  scope :ps4, -> { where(platform: 'PS4') }
  scope :xbox, -> { where(platform: 'Xbox One') }
  scope :pc, -> { where(platform: 'PC') }
  scope :switch, -> { where(platform: 'Switch') }
  scope :rpg, -> { where(genre: 'RPG') }
  scope :shooter, -> { where(genre: 'Shooter') }
  scope :sports, -> { where(genre: 'Sports') }
  scope :mmo, -> { where(genre: 'MMO') }
  scope :platformer, -> { where(genre: 'Platformer') }

end
