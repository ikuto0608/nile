# == Schema Information
#
# Table name: offer_deliveries
#
#  id          :integer          not null, primary key
#  product     :string
#  price       :decimal(, )
#  message     :text
#  customer_id :integer
#  deliver_id  :integer
#  wishlist_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class OfferDelivery < ApplicationRecord
end
