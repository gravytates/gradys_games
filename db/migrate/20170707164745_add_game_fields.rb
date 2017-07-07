class AddGameFields < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :genre, :string
    add_column :games, :platform, :string
  end
end
