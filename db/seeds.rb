# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Sub.destroy_all
Post.destroy_all

5.times do
  User.create(username: Faker::Name.first_name, password: 'password')
end

User.all.each do |user|
  3.times do
      user.subs.create(title: Faker::Simpsons.quote)
  end
end

user_ids = User.all.ids

Sub.all.each do |subforum|

  3.times do
    subforum.posts.create(
      title: Faker::HitchhikersGuideToTheGalaxy.marvin_quote,
      author_id: user_ids.sample
      )
  end
end
