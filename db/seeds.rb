# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating!!!!"
puts "...."

3.times do
  name_fake = Faker::Name.first_name
  user_translator = User.new(
    { name: name_fake,
      email: Faker::Internet.free_email(name: name_fake),
      password: "123456",
      password_confirmation: "123456",
      contact: Faker::PhoneNumber.cell_phone }
  )
  user_translator.save!

  user_client = User.new(
    { name: name_fake,
      email: Faker::Internet.free_email(name: name_fake),
      password: "123456",
      password_confirmation: "123456",
      contact: Faker::PhoneNumber.cell_phone }
  )
  user_client.save!

  services = TranslationService.new(
    location: Faker::Address.country,
    original_language: Faker::Nation.language,
    final_language: Faker::Nation.language,
    user_id: user_translator.id
  )
  services.save!

  order = Order.new(
    user_id: user_client.id,
    translation_service_id: services.id,
    date: Faker::Date.in_date_period,
    status: "active",
    final_cost: Faker::Number.decimal(l_digits: 2)
  )
  order.save!
end

puts "Finished Seed!!! =)"
