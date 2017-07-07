class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string "name"
      t.string "description"
      t.money "price"
      t.string "image"

      t.timestamps
    end

    create_table :reviews do |t|
      t.string "body"
      t.integer "rating"
      t.integer "game_id"
      t.integer "user_id"

      t.timestamps
    end
  end
end
