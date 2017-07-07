# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

# admin = FactoryGirl.create(:admin_user)
User.create!(name: "Grady", admin: true, email: "adming@adming", password: "123456" )
users = []
5.times do |index|
  users.push(FactoryGirl.create(:user))
end
games = []
10.times do |index|
  games.push(Game.create!(name: Faker::Ancient.unique.titan, image: "http://www.fillmurray.com/g/300/300", price: Faker::Commerce.price, description: Faker::ChuckNorris.fact, genre: 'RPG', platform: 'PS4'))
end

games.each do |game|
  users.each do |user|
    review = user.reviews.new(body: Faker::Friends.quote, rating: Faker::Number.between(1, 5))
    game.reviews.push(review)
    user.reviews.push(review)
  end
end
# users.each do |user|
#   games.each do |game|
#     user.push(game.reviews.create!(body: Faker::Friends.quote, rating: Faker::Number.between(1, 5)))
#   end
# end
#
#
#
#
#
#
# user_list = [
#   ["Grady the Administrator", true, "admin11@admin", "123456"],
#   ["Rick", false, 0, "rick11@rick", "123456"],
# ]
#
# user_list.each do |name, admin, email, password|
#   User.create!(name: name, admin: admin, email: email, password: password )
# end
#
#   15.times do |index|
#     game = Game.create!(name: Faker::Ancient.titan, image: "http://www.fillmurray.com/g/300/300", price: Faker::Commerce.price, description: Faker::ChuckNorris.fact, genre: 'RPG', platform: 'PS4')
#     3.times do |index|
#       user.push(game.reviews.create!(body: Faker::Friends.quote, rating: Faker::Number.between(1, 5)))
#     end
#   end
