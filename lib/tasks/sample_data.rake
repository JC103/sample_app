namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_microposts
    make_relationships
  end
end

def make_users
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
    User.create!(name: "Kotobuki Tsumugi",
                 email: "kotobuki@tsumugi.jp",
                 password: "Kotobuki",
                 password_confirmation: "Kotobuki",
                 admin: false)
    User.create!(name: "Tainaka Ritsu",
                 email: "tainaka@ritsu.jp",
                 password: "Tainaka",
                 password_confirmation: "Tainaka",
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
end

def make_microposts
      users = User.all(limit: 6)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }
      end
end

def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end