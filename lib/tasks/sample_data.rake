namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example Admin",
                         email: "admin@rails.org",
                         password: "hodorr",
                         password_confirmation: "hodorr",
                         admin: true)
				 
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
	
	users = User.all(limit: 6)
    50.times do
      description = Faker::Lorem.sentence(5)
	  title = Faker::Name.title
	  time = rand(-10.years..10.years).seconds.ago
	  venue = Faker::Address.street_address(include_secondary = true) + ", " + Faker::Address.city + ", " + Faker::Address.country + ", " + Faker::Address.zip_code
      users.each { |user| user.events.create!(description: description, title: title, time: time, venue: venue) }
    end
	
	users = User.all
    user  = users.first
    followed_users = users[2..50]
    followers      = users[3..40]
    followed_users.each { |followed| user.follow!(followed) }
    followers.each      { |follower| follower.follow!(user) }
  end
end