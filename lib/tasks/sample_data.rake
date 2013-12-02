namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Akiyama Mio",
                 email: "akiyama@mio.jp",
                 password: "Elizabeth",
                 password_confirmation: "Elizabeth",
                 admin: true)
    User.create!(name: "Hirasawa Yui",
                 email: "hirasawa@yui.jp",
                 password: "Hirasawa",
                 password_confirmation: "Hirasawa",
                 admin: false)
    User.create!(name: "Nakano Azusa",
                 email: "nakano@azusa.jp",
                 password: "Nakano",
                 password_confirmation: "Nakano",
                 admin: false)
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
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }

    end
  end
end

