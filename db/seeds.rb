# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
include Faker
include Countries
1000.times do
  c = ISO3166::Country.new(Faker::Address.country_code)
  Player.create(
    name: Faker::FunnyName.name,
    category: Faker::Job.employment_type,
    country: c.alpha3,
    created_at: Faker::Date.between(30.days.ago, Date.today)
  )
end
