# == Schema Information
#
# Table name: reviews
#
#  id             :integer          not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  reviewer_id    :integer
#  reviewee_id    :integer
#  rating         :integer
#  description    :string
#  transaction_id :integer
#

class Review < ApplicationRecord
  belongs_to :user
end
