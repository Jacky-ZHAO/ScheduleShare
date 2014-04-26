namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar")
				 
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
      users.each { |user| user.events.create!(description: description, title: title) }
    end
  end
end