# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or find_or_create_byd alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.find_or_create_by([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.find_or_create_by(name: 'Luke', movie: movies.first)
Location.find_or_create_by!(city_name: 'tokyo', lat: 35.689488, long: 139.691706)
Location.find_or_create_by!(city_name: 'kyoto', lat: 35.021247, long: 135.755597)
Location.find_or_create_by!(city_name: 'vancouver', lat: 49.282729, long: -123.120738)
Location.find_or_create_by!(city_name: 'shanghai', lat: 31.23039, long: 121.473702)

User.find_or_create_by!(
  full_name: 'Wesley Wong',
  email: 'wes@mail.com',
  password_digest: '1234',
  tag_line: Faker::Lorem.sentence,
  profile_pic: Faker::Fillmurray.image,
  location_id: Location.all.sample.id
  )
User.find_or_create_by!(
  full_name: 'Ikuto Yata',
  email: 'ikuto@mail.com',
  password_digest: '1234',
  tag_line: Faker::Lorem.sentence,
  profile_pic: Faker::Fillmurray.image,
  location_id: Location.all.sample.id
  )
User.find_or_create_by!(
  full_name: 'Ayako Sayama',
  email: 'ayako@mail.com',
  password_digest: '1234',
  tag_line: Faker::Lorem.sentence,
  profile_pic: Faker::Fillmurray.image,
  location_id: Location.all.sample.id
  )
User.find_or_create_by!(
  full_name: 'Jonathan Sue',
  email: 'jonathan@mail.com',
  password_digest: '1234',
  tag_line: Faker::Lorem.sentence,
  profile_pic: Faker::Fillmurray.image,
  location_id: Location.all.sample.id
  )
User.find_or_create_by!(
  full_name: 'Matt Willcroix',
  email: 'matt@mail.com',
  password_digest: '1234',
  tag_line: Faker::Lorem.sentence,
  profile_pic: Faker::Fillmurray.image,
  location_id: Location.all.sample.id
  )
User.find_or_create_by!(
  full_name: 'Alex Hache',
  email: 'alex@mail.com',
  password_digest: '1234',
  tag_line: Faker::Lorem.sentence,
  profile_pic: Faker::Fillmurray.image,
  location_id: Location.all.sample.id
  )

users = User.all
locations = Location.all
location_ids = Location.pluck(:id)

users.each do |u|
  starting = Random.rand(5..12)
  ending = Random.rand(5..12)
  UserLocation.find_or_create_by!(
    start_time: Date.current - starting.days,
    end_time: Date.current + ending.days,
    user_id: u.id,
    location_id: location_ids.sample
  )

end


statuses = ['pending', 'complete']

10.times do |i|
  buyer = Random.rand(1..3)
  seller = Random.rand(4..6)
  Transaction.find_or_create_by!(
    buyer_id: buyer,
    seller_id: seller,
    price: Faker::Number.decimal(2),
    description: Faker::Lorem.sentence,
    status: statuses.sample
  )
end

transactions = Transaction.all

transactions.each do |t|
  if t.status == 'complete'
    Review.find_or_create_by!(
      rating: Random.rand(1..5),
      description: Faker::Lorem.sentence,
      reviewer_id: t.buyer_id,
      reviewee_id: t.seller_id,
      transaction_id: t.id
    )
  end
end

3.times do |i|
  Wishlist.find_or_create_by!(
    user_id: i + 1,
    description: 'I want ' + Faker::Food.dish,
    location_id: location_ids.sample,
    due_date: Date.current + Random.rand(2..7).days
  )
end
