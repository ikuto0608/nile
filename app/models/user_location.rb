# == Schema Information
#
# Table name: user_locations
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  start_time   :datetime
#  end_time     :datetime
#  users_id     :integer
#  locations_id :integer
#

class UserLocation < ApplicationRecord
  belongs_to :user
  belongs_to :location
end
