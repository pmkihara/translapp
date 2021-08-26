# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating!!!!"
puts "...."

Job.destroy_all
Offer.destroy_all
User.destroy_all

user = User.new(
  name: 'Pilantra',
  email: 'p@p.com',
  password: "123456",
  password_confirmation: "123456",
  contact: '9'
)
user.save

6.times do
  name_fake = Faker::Name.first_name
  user_translator = User.new(
    { name: name_fake,
      email: Faker::Internet.free_email(name: name_fake),
      password: "123456",
      password_confirmation: "123456",
      contact: Faker::PhoneNumber.cell_phone }
  )
  user_translator.save!

  name_fake = Faker::Name.first_name
  user_client = User.new(
    { name: name_fake,
      email: Faker::Internet.free_email(name: name_fake),
      password: "123456",
      password_confirmation: "123456",
      contact: Faker::PhoneNumber.cell_phone }
  )
  user_client.save!

  offer = Offer.new(
    location: Faker::Address.country,
    original_language: Faker::Nation.language,
    final_language: Faker::Nation.language,
    description: Faker::Lorem.sentence,
    price_per_hour: Faker::Number.between(from: 20.0, to: 150.0).round(2),
    service_hours: rand(1..80),
    date: Faker::Date.in_date_period,
    remote: [true, false].sample,
    user: user_client
  )
  offer.save!

  job = Job.new(
    user: user_translator,
    offer: offer,
    date: offer.date,
    final_cost: offer.price_per_hour * offer.service_hours
  )
  job.save!
end

puts "Toma aí teu usuário pra testes '#{User.last.email}' :)"

puts "Finished Seed!!! =)"
