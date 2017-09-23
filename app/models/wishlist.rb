# == Schema Information
#
# Table name: wishlists
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  description :text
#  location_id :integer
#  due_date    :datetime
#

class Wishlist < ApplicationRecord
  has_one :user
  has_one :location

end
