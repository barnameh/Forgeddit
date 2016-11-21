# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

jay = User.create(name: "Jay", password: "allthesame")
john = User.create(name: "John", password: "allthesame")
jay_link = jay.links.create(url: "www.apple.com")
john_comment = jay_link.comments.create(user_id: john.id, text: "everything is so expensive")

users = []
links = []
10.times do
  user = User.create(name: FFaker::Name.name, password: "allthesame")
  users << user
  10.times do
    link = user.links.create(url: FFaker::Youtube.url)
    links << link
  end
end

links.each do |link|
  users.each do |user|
    link.comments.create(user_id: user.id, text: FFaker::Tweet.body)
  end
end
