# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  instragram_url  :string
#  pintrest_url    :string
#  tag_line        :string
#  full_name       :string
#  email           :string
#  password_digest :string
#  profile_pic     :string
#  location_id     :integer
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
