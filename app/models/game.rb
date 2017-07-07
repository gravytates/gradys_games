class Game < ApplicationRecord
  validates :name, :description, :price, :image, :genre, :platform, presence: true
  validates :price, numericality: true
  before_save(:titlecase)

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

  def average_rating
  average = 0
  total = 0
  if self.reviews.length != 0
    self.reviews.each { |review| total += review.rating }
    (total.round(1) / self.reviews.length.round(1)).round(1)
  else
    average.to_f
  end
end

private
  def titlecase
    new_name = self.name.split(' ')
      .each{|word| word.capitalize! }
      .join(' ')
    self.name = new_name
  end

end
