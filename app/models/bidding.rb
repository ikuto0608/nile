# == Schema Information
#
# Table name: biddings
#
#  id          :integer          not null, primary key
#  price       :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  wishlist_id :integer
#

class Bidding < ApplicationRecord
  belongs_to :user
  belongs_to :wishlist
end
