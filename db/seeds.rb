# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating!!!!"
puts "...."

User.destroy_all if Rails.env.development?

paty = User.new(
  name: 'Patrícia',
  email: 'paty@paty.com',
  password: "123456",
  password_confirmation: "123456",
  contact: '99999-9999'
)
paty.save

igor = User.new(
  name: 'Igor',
  email: 'igor@igor.com',
  password: "123456",
  password_confirmation: "123456",
  contact: '99999-9999'
)
igor.save

bruno = User.new(
  name: 'Bruno',
  email: 'bruno@bruno.com',
  password: "123456",
  password_confirmation: "123456",
  contact: '99999-9999'
)
bruno.save

felipe = User.new(
  name: 'Felipe',
  email: 'felipe@felipe.com',
  password: "123456",
  password_confirmation: "123456",
  contact: '99999-9999'
)
felipe.save

users = [paty, igor, bruno, felipe].cycle

6.times do
  offer = Offer.new(
    location: Faker::Address.city,
    original_language: Faker::Nation.language,
    final_language: Faker::Nation.language,
    price_per_hour: Faker::Number.between(from: 5, to: 50).round(2),
    service_hours: rand(1..10),
    date: Faker::Date.in_date_period,
    remote: [true, false].sample,
    user: users.next
  )
  offer.description = "I need a #{offer.original_language} to #{offer.final_language} translator on #{offer.date}. I need it for #{offer.service_hours} hours and I'm willing to pay up to $#{offer.price_per_hour} an hour."
  offer.save

  job = Job.new(
    user: users.next,
    offer: offer,
    date: offer.date,
    final_cost: offer.price_per_hour * offer.service_hours
  )
  job.save
end

puts "Finished Seed!!! =)"
