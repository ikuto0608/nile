# == Schema Information
#
# Table name: transactions
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  buyer_id    :integer
#  seller_id   :integer
#  description :string
#  price       :decimal(, )
#  status      :string
#

require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
