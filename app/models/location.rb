# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  city_name  :string
#  lat        :decimal(, )
#  long       :decimal(, )
#

class Location < ApplicationRecord
  has_many :user_locations
  has_many :users, through: :user_locations

end
