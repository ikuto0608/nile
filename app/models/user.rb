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
#

class User < ApplicationRecord
  has_many :reviews, foreign_key: 'reviewee_id'
  has_many :wishlists
  has_many :reviews_as_reviewer, foreign_key: "reviewer_id", class_name: "Review"
  has_many :reviews_as_reviewee, foreign_key: "reviewee_id", class_name: "Review"
  has_many :bittings

  validates :full_name, presence: true
  validates :email, presence: true, uniqueness: true
  has_secure_password


end
