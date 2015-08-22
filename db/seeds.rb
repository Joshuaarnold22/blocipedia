require 'faker'

user = User.new(
name: 'Josh',
email: 'joshuaarnold22@gmail.com',
password: 'helloworld'
)
user.skip_confirmation!
user.save!

user = User.new(
name: 'test',
email: 'test@gmail.com',
password: 'helloworld'
)
user.skip_confirmation!
user.save!

3.times do
  user = User.new(
  name: Faker::Name.name,
  email: Faker::Internet.email,
  password: Faker::Lorem.characters(8)
  )
  user.skip_confirmation!
  user.save!
end

users = User.all

10.times do
  Wiki.create!(
    user: users.sample,
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
  )
end

wikis = Wiki.all
