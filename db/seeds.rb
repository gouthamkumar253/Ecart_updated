# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
  Instrument.create({brand: 'Fender',model: 'Guitar',description: 'Something',condition: 'Excellent', finish: Faker::Commerce.color,title: Faker::Commerce.product_name, price: Faker::Commerce.price, created_at: '2019-01-05',updated_at:'2019-01-05',image: File.open(File.join(Rails.root, "instrument1.jpg")), user_id: '14'})
end

