class AddAvatarToGames < ActiveRecord::Migration[5.1]
  def change
    add_attachment :games, :avatar
  end
end
