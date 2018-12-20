# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Band.destroy_all

user1 = User.create(email: 'jtdespinosa@gmail.com', password_digest: "#{BCrypt::Password.create('starwars')}", session_token: "#{SecureRandom::urlsafe_base64(16)}")
user2 = User.create(email: 'joe@downtown304.com.com', password_digest: "#{BCrypt::Password.create('starwars')}", session_token: "#{SecureRandom::urlsafe_base64(16)}")
user3 = User.create(email: 'joe@wellingtongraphics.com', password_digest: "#{BCrypt::Password.create('starwars')}", session_token: "#{SecureRandom::urlsafe_base64(16)}")

band1 = Band.create(name: "Depeche Mode")
band2 = Band.create(name: "Erasure")
band3 = Band.create(name: "CHVRCHES")
