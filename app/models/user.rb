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

class User < ApplicationRecord
  has_many :reviews, foreign_key: 'reviewee_id'
  has_many :wishlists
  has_many :reviews_as_reviewer, foreign_key: "reviewer_id", class_name: "Review"
  has_many :reviews_as_reviewee, foreign_key: "reviewee_id", class_name: "Review"
  has_many :user_locations

  validates :full_name, presence: true
  validates :email, presence: true, uniqueness: true
  has_secure_password

  def has_plan?
    self.user_locations.present?
  end

  def has_plan_with?(location_ids)
    return false if !self.user_locations.present?
    self.user_locations.exists?(location_id: location_ids)
  end

  def location_name
    @location_name ||= Location.find(self.location_id).city_name
  end
end
