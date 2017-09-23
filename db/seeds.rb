# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or find_or_create_byd alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.find_or_create_by([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.find_or_create_by(name: 'Luke', movie: movies.first)
Location.find_or_create_by!(city_name: 'Tokyo')
Location.find_or_create_by!(city_name: 'Kyoto')
Location.find_or_create_by!(city_name: 'Vancouver')
Location.find_or_create_by!(city_name: 'Shanghai')

User.find_or_create_by!(full_name: 'Wesley Wong', email: 'wes@mail.com')
User.find_or_create_by!(full_name: 'Ikuto Yata', email: 'ikuto@mail.com')
User.find_or_create_by!(full_name: 'Ayako Sayama', email: 'ayako@mail.com')
User.find_or_create_by!(full_name: 'Jonathan Sue', email: 'jonathan@mail.com')
User.find_or_create_by!(full_name: 'Matt Willcroix', email: 'matt@mail.com')
User.find_or_create_by!(full_name: 'Alex Hache', email: 'alex@mail.com')

users = User.all
locations = Location.all
location_ids = Location.pluck(:id)

users.each do |u|
  starting = Random.rand(5..12)
  ending = Random.rand(5..12)
  UserLocation.find_or_create_by!(
    start_time: Date.current - starting, 
    end_time: Date.current + ending, 
    user_id: u.id, 
    location_id: location_ids.sample
  )
end
